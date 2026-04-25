import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/foundation/app/twake_calendar_app.dart';
import 'package:twake_calendar_mobile/foundation/providers/kernel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final ProviderContainer container = ProviderContainer();
  // Attach Dio interceptors before any HTTP request fires.
  unawaited(container.read(kernelProvider.future));
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const TwakeCalendarApp(),
    ),
  );
}

void unawaited(Future<void> future) {
  // ignore: discarded_futures
  future.ignore();
}
