import 'failures.dart';

/// Maps technical failures into user-facing messages.
String mapFailureToMessage(Failure failure) {
  if (failure is NetworkFailure) {
    return 'No internet connection.';
  }
  if (failure is ServerFailure) {
    return failure.message;
  }
  if (failure is CacheFailure) {
    return failure.message;
  }
  return 'Unexpected error. Please try again.';
}
