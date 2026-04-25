import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/attendee_role.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/cutype.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/people/domain/entities/person.dart';
import 'package:twake_calendar_mobile/features/people/people_providers.dart';

/// Field-style attendee search + list of currently selected attendees.
///
/// A debounced text input queries `/api/people/search`; matching contacts
/// are exposed as suggestions. Tapping a suggestion adds an
/// [AttendeeEntity] (REQ-PARTICIPANT, NEEDS-ACTION, RSVP TRUE) to the
/// list. Each chip removes the attendee on close.
class AttendeeSearchField extends ConsumerStatefulWidget {
  /// Creates an [AttendeeSearchField].
  const AttendeeSearchField({
    required this.attendees,
    required this.onChanged,
    super.key,
  });

  /// Currently selected attendees.
  final List<AttendeeEntity> attendees;

  /// Called whenever the attendees list changes.
  final ValueChanged<List<AttendeeEntity>> onChanged;

  @override
  ConsumerState<AttendeeSearchField> createState() =>
      _AttendeeSearchFieldState();
}

class _AttendeeSearchFieldState extends ConsumerState<AttendeeSearchField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  List<PersonEntity> _suggestions = const <PersonEntity>[];
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () => _search(value));
  }

  Future<void> _search(String query) async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final List<PersonEntity> results =
          await ref.read(peopleRepositoryProvider).search(query);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _suggestions = results;
      });
    } on Exception catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _add(PersonEntity person) {
    if (widget.attendees
        .any((AttendeeEntity a) => a.calAddress == person.email)) {
      return;
    }
    final List<AttendeeEntity> next = <AttendeeEntity>[
      ...widget.attendees,
      AttendeeEntity(
        calAddress: person.email,
        cn: person.displayName,
        role: AttendeeRole.reqParticipant,
        cutype: CuType.individual,
        partstat: Partstat.needsAction,
        rsvp: true,
      ),
    ];
    widget.onChanged(next);
    _controller.clear();
    setState(() => _suggestions = const <PersonEntity>[]);
  }

  void _remove(AttendeeEntity attendee) {
    widget.onChanged(
      widget.attendees
          .where((AttendeeEntity a) => a.calAddress != attendee.calAddress)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: context.l10n.eventAttendees,
            prefixIcon: const Icon(Icons.person_add_alt_1),
            border: const OutlineInputBorder(),
          ),
          onChanged: _onChanged,
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _error!,
              style: TextStyle(color: context.colorScheme.error),
            ),
          ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: LinearProgressIndicator(),
          ),
        if (_suggestions.isNotEmpty)
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 220),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              separatorBuilder: (BuildContext _, int _) =>
                  const Divider(height: 0),
              itemBuilder: (BuildContext c, int i) {
                final PersonEntity person = _suggestions[i];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(_initial(person.displayName)),
                  ),
                  title: Text(person.displayName),
                  subtitle: Text(person.email),
                  onTap: () => _add(person),
                );
              },
            ),
          ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: <Widget>[
            for (final AttendeeEntity attendee in widget.attendees)
              InputChip(
                avatar: CircleAvatar(
                  child: Text(_initial(
                    attendee.cn.isNotEmpty
                        ? attendee.cn
                        : attendee.calAddress,
                  )),
                ),
                label: Text(
                  attendee.cn.isNotEmpty ? attendee.cn : attendee.calAddress,
                ),
                onDeleted: () => _remove(attendee),
              ),
          ],
        ),
      ],
    );
  }

  String _initial(String value) =>
      value.isEmpty ? '?' : value.substring(0, 1).toUpperCase();
}
