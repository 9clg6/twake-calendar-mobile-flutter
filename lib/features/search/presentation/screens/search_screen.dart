import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';
import 'package:twake_calendar_mobile/features/search/presentation/controllers/search_controller.dart';
import 'package:twake_calendar_mobile/features/search/presentation/controllers/search_state.dart';

/// Event search screen — text input on top, hit list below.
class SearchScreen extends ConsumerStatefulWidget {
  /// Creates a [SearchScreen].
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchState state = ref.watch(eventSearchControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.searchTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: context.l10n.searchKeywordsHint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              onChanged: (String v) => ref
                  .read(eventSearchControllerProvider.notifier)
                  .onQueryChanged(v),
              onSubmitted: (_) =>
                  ref.read(eventSearchControllerProvider.notifier).submit(),
            ),
            const Gap(12),
            Expanded(child: _Results(state: state)),
          ],
        ),
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.state});

  final SearchState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(
        child: Text(
          state.error!,
          style: TextStyle(color: context.colorScheme.error),
        ),
      );
    }
    if (state.results.isEmpty) {
      return Center(
        child: Text(
          context.l10n.searchEmpty,
          style: context.textTheme.bodyLarge,
        ),
      );
    }
    return ListView.separated(
      itemCount: state.results.length,
      separatorBuilder: (BuildContext _, int _) => const Divider(),
      itemBuilder: (BuildContext c, int i) {
        final SearchHitEntity hit = state.results[i];
        return ListTile(
          title: Text(hit.summary ?? ''),
          subtitle: Text(<String>[
            if (hit.start != null) hit.start!,
            if (hit.location != null && hit.location!.isNotEmpty)
              hit.location!,
          ].join(' · ')),
          trailing: hit.organizer != null
              ? Text(
                  hit.organizer!,
                  style: c.textTheme.bodySmall,
                )
              : null,
        );
      },
    );
  }
}
