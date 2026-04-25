import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';

/// Generic error screen displayed when the app fails to bootstrap or when a
/// route's redirect catches an unrecoverable failure.
class ErrorScreen extends StatelessWidget {
  /// Creates an [ErrorScreen].
  const ErrorScreen({super.key, this.message, this.onRetry});

  /// Optional message to display below the standard title.
  final String? message;

  /// Optional retry callback.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 40,
                color: context.colorScheme.error,
              ),
              const Gap(12),
              Text(
                context.l10n.errorTitle,
                style: context.textTheme.headlineMedium,
              ),
              const Gap(8),
              Text(
                message ?? context.l10n.errorUnknown,
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              if (onRetry != null) ...<Widget>[
                const Gap(16),
                FilledButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: Text(context.l10n.actionsRetry),
                  onPressed: onRetry,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
