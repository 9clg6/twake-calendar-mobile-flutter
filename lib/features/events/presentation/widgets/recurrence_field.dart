import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';

/// End option discriminator used by the RRULE modal.
enum _EndOption { never, after, on }

/// Returns the discriminator inferred from [repetition].
_EndOption _endOptionOf(RepetitionEntity? repetition) {
  if (repetition == null) return _EndOption.never;
  if (repetition.count != null) return _EndOption.after;
  if (repetition.until != null) return _EndOption.on;
  return _EndOption.never;
}

/// Form field exposing the current [RepetitionEntity] and a tap handler
/// opening [RecurrenceModal].
class RecurrenceField extends StatelessWidget {
  /// Creates a [RecurrenceField].
  const RecurrenceField({
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// Current value (null = no recurrence).
  final RepetitionEntity? value;

  /// Called whenever the user picks a new value.
  final ValueChanged<RepetitionEntity?> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.repeat),
      title: Text(context.l10n.eventRepeat),
      subtitle: Text(_summary(context, value)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
        final RepetitionEntity? picked = await showDialog<RepetitionEntity?>(
          context: context,
          builder: (_) => RecurrenceModal(initial: value),
        );
        // Distinguish dismissed dialog (null returned via Navigator.pop()
        // without value) vs explicit "doesn't repeat" — the modal returns
        // a sentinel via showDialog's barrier dismiss, which we treat as
        // "leave value unchanged". Explicit clear uses the trash button.
        if (picked == null) return;
        onChanged(picked.freq == _kClearedFreq ? null : picked);
      },
    );
  }

  String _summary(BuildContext context, RepetitionEntity? r) {
    if (r == null) return context.l10n.eventDoesNotRepeat;
    final String freqLabel = switch (r.freq) {
      RepeatFreq.daily => context.l10n.eventRepeatDays,
      RepeatFreq.weekly => context.l10n.eventRepeatWeeks,
      RepeatFreq.monthly => context.l10n.eventRepeatMonths,
      RepeatFreq.yearly => context.l10n.eventRepeatYears,
    };
    return '${context.l10n.eventRepeatEvery} ${r.interval} $freqLabel';
  }
}

/// Sentinel used to signal an explicit clear from the modal.
const RepeatFreq _kClearedFreq = RepeatFreq.daily;

/// Modal letting the user pick a [RepetitionEntity] (frequency, interval,
/// byday, end option). Returns the picked value, or null if dismissed.
class RecurrenceModal extends StatefulWidget {
  /// Creates a [RecurrenceModal].
  const RecurrenceModal({this.initial, super.key});

  /// Initial value, or null for a fresh selection.
  final RepetitionEntity? initial;

  @override
  State<RecurrenceModal> createState() => _RecurrenceModalState();
}

class _RecurrenceModalState extends State<RecurrenceModal> {
  late RepeatFreq _freq;
  late int _interval;
  late Set<String> _byday;
  late _EndOption _endOption;
  int _count = 10;
  DateTime _until = DateTime.now().add(const Duration(days: 90));

  static const List<String> _weekDays = <String>[
    'MO',
    'TU',
    'WE',
    'TH',
    'FR',
    'SA',
    'SU',
  ];

  @override
  void initState() {
    super.initState();
    final RepetitionEntity? r = widget.initial;
    _freq = r?.freq ?? RepeatFreq.weekly;
    _interval = r?.interval ?? 1;
    _byday = <String>{...?r?.byday};
    _endOption = _endOptionOf(r);
    if (r?.count != null) _count = r!.count!;
    if (r?.until != null) {
      _until = DateTime.tryParse(r!.until!) ?? _until;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.eventRepeat),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 64,
                    child: TextFormField(
                      initialValue: '$_interval',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      onChanged: (String v) {
                        final int? parsed = int.tryParse(v);
                        if (parsed != null && parsed > 0) {
                          setState(() => _interval = parsed);
                        }
                      },
                    ),
                  ),
                  const Gap(12),
                  DropdownButton<RepeatFreq>(
                    value: _freq,
                    onChanged: (RepeatFreq? v) {
                      if (v == null) return;
                      setState(() => _freq = v);
                    },
                    items: <DropdownMenuItem<RepeatFreq>>[
                      DropdownMenuItem<RepeatFreq>(
                        value: RepeatFreq.daily,
                        child: Text(context.l10n.eventRepeatDays),
                      ),
                      DropdownMenuItem<RepeatFreq>(
                        value: RepeatFreq.weekly,
                        child: Text(context.l10n.eventRepeatWeeks),
                      ),
                      DropdownMenuItem<RepeatFreq>(
                        value: RepeatFreq.monthly,
                        child: Text(context.l10n.eventRepeatMonths),
                      ),
                      DropdownMenuItem<RepeatFreq>(
                        value: RepeatFreq.yearly,
                        child: Text(context.l10n.eventRepeatYears),
                      ),
                    ],
                  ),
                ],
              ),
              if (_freq == RepeatFreq.weekly) ...<Widget>[
                const Gap(16),
                Text(context.l10n.eventRepeatOn,
                    style: context.textTheme.bodySmall),
                const Gap(8),
                Wrap(
                  spacing: 6,
                  children: <Widget>[
                    for (final String d in _weekDays)
                      FilterChip(
                        label: Text(d),
                        selected: _byday.contains(d),
                        onSelected: (bool sel) => setState(() {
                          if (sel) {
                            _byday.add(d);
                          } else {
                            _byday.remove(d);
                          }
                        }),
                      ),
                  ],
                ),
              ],
              const Gap(16),
              RadioGroup<_EndOption>(
                groupValue: _endOption,
                onChanged: (_EndOption? v) {
                  if (v == null) return;
                  setState(() => _endOption = v);
                },
                child: Column(
                  children: <Widget>[
                    RadioListTile<_EndOption>(
                      contentPadding: EdgeInsets.zero,
                      value: _EndOption.never,
                      title: Text(context.l10n.eventRepeatEndNever),
                    ),
                    RadioListTile<_EndOption>(
                      contentPadding: EdgeInsets.zero,
                      value: _EndOption.after,
                      title: Row(
                        children: <Widget>[
                          Text('${context.l10n.eventRepeatEndAfter} '),
                          SizedBox(
                            width: 56,
                            child: TextFormField(
                              initialValue: '$_count',
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String v) {
                                final int? p = int.tryParse(v);
                                if (p != null && p > 0) {
                                  setState(() => _count = p);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    RadioListTile<_EndOption>(
                      contentPadding: EdgeInsets.zero,
                      value: _EndOption.on,
                      title: Row(
                        children: <Widget>[
                          Text('${context.l10n.eventRepeatEndOn} '),
                          TextButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: _until,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2035, 12, 31),
                              );
                              if (picked != null) {
                                setState(() => _until = picked);
                              }
                            },
                            child: Text(_until.toIso8601String().split('T').first),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop<RepetitionEntity?>(_clearedSentinel()),
          child: Text(context.l10n.eventDoesNotRepeat),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop<RepetitionEntity?>(),
          child: Text(context.l10n.actionsCancel),
        ),
        FilledButton(
          onPressed: () =>
              Navigator.of(context).pop<RepetitionEntity?>(_buildResult()),
          child: Text(context.l10n.actionsSave),
        ),
      ],
    );
  }

  RepetitionEntity _clearedSentinel() => const RepetitionEntity(
        freq: _kClearedFreq,
        interval: -1,
      );

  RepetitionEntity _buildResult() {
    return RepetitionEntity(
      freq: _freq,
      interval: _interval,
      byday: _freq == RepeatFreq.weekly ? _byday.toList() : <String>[],
      count: _endOption == _EndOption.after ? _count : null,
      until: _endOption == _EndOption.on
          ? _until.toIso8601String().split('T').first
          : null,
    );
  }
}
