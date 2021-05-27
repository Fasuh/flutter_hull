import 'failures.dart';

Failure handleError({required dynamic error, required Failure defaultFailure}) {
  if(error is Failure) {
    return error;
  }
  return defaultFailure;
}
