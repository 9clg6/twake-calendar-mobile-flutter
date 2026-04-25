/// Result of executing a use case: either a [Success] or a [Failure].
///
/// Used as the return type of [BaseUseCase.execute]. Pattern-match with
/// [when] to handle both branches without forgetting one.
sealed class ResultState<T> {
  const ResultState._();

  /// Builds a success result wrapping [data].
  factory ResultState.success(T data) = Success<T>;

  /// Builds a failure result wrapping [exception].
  factory ResultState.failure(Exception exception) = Failure<T>;

  /// Pattern-matches the result.
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception exception) failure,
  });
}

/// Successful result.
final class Success<T> extends ResultState<T> {
  /// Creates a [Success] wrapping [data].
  const Success(this.data) : super._();

  /// Wrapped data.
  final T data;

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception exception) failure,
  }) =>
      success(data);
}

/// Failure result.
final class Failure<T> extends ResultState<T> {
  /// Creates a [Failure] wrapping [exception].
  const Failure(this.exception) : super._();

  /// Wrapped exception.
  final Exception exception;

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception exception) failure,
  }) =>
      failure(exception);
}
