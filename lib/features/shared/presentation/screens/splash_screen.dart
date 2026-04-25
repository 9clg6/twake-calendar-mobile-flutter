import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// Initial splash screen displayed while the kernel boots.
///
/// In the absence of a real auth state for the moment, jumps directly to the
/// calendar layout once the first frame is rendered. The OIDC redirect logic
/// will land in `features/auth/` and gate this navigation.
class SplashScreen extends ConsumerStatefulWidget {
  /// Creates a [SplashScreen].
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      const CalendarRoute().go(context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
