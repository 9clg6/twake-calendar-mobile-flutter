import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';

/// Initial splash screen displayed while the kernel boots.
class SplashScreen extends ConsumerWidget {
  /// Creates a [SplashScreen].
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircularProgressIndicator.adaptive(),
            const Gap(16),
            Text(
              context.l10n.splashLoading,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
