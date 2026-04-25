import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// Login screen — single sign-in button driving the OIDC flow.
class LoginScreen extends ConsumerWidget {
  /// Creates a [LoginScreen].
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState state = ref.watch(authControllerProvider);

    ref.listen<AuthState>(authControllerProvider, (
      AuthState? previous,
      AuthState next,
    ) {
      if (next.isLoggedIn && previous?.isLoggedIn != true && context.mounted) {
        const CalendarRoute().go(context);
      }
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                context.l10n.appName,
                style: context.textTheme.displayLarge,
              ),
              const Gap(24),
              if (state.error != null) ...<Widget>[
                Text(
                  state.error!,
                  style: TextStyle(color: context.colorScheme.error),
                  textAlign: TextAlign.center,
                ),
                const Gap(12),
              ],
              FilledButton(
                onPressed: state.isLoading
                    ? null
                    : () =>
                        ref.read(authControllerProvider.notifier).signIn(),
                child: state.isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(context.l10n.actionsConfirm),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
