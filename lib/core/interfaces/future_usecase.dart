import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/core/interfaces/usecase.dart';

/// Asynchronous use case without parameters.
///
/// Subclasses implement [invoke] only; [execute] is provided and applies
/// the standard try/catch + timeout wrapper.
abstract class FutureUseCase<T>
    implements BaseUseCase<Future<ResultState<T>>> {
  @override
  Future<ResultState<T>> execute() => futureCatcher<T>(invoke);

  /// Business logic of the use case. Must be implemented by subclasses.
  Future<T> invoke();
}

/// Asynchronous use case with parameters.
abstract class FutureUseCaseWithParams<T, P>
    implements BaseUseCaseWithParams<Future<ResultState<T>>, P> {
  @override
  Future<ResultState<T>> execute(P params) =>
      futureCatcher<T>(() => invoke(params));

  /// Business logic of the use case. Must be implemented by subclasses.
  Future<T> invoke(P params);
}
