import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';

/// Abstract use case without parameters.
abstract class BaseUseCase<T> {
  /// Public entry point. Wraps [invoke] with try/catch + timeout.
  T execute();
}

/// Abstract use case with parameters.
abstract class BaseUseCaseWithParams<T, P> {
  /// Public entry point. Wraps [invoke] with try/catch + timeout.
  T execute(P params);
}

/// Default timeout applied to a single use case execution.
const Duration kUseCaseTimeout = Duration(seconds: 15);

/// Wraps an asynchronous body in a [ResultState] with a default timeout.
Future<ResultState<T>> futureCatcher<T>(
  Future<T> Function() body, {
  Duration timeout = kUseCaseTimeout,
}) async {
  try {
    final T value = await body().timeout(timeout);
    return ResultState<T>.success(value);
  } on Exception catch (e) {
    return ResultState<T>.failure(e);
  }
}
