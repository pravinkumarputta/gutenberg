import 'api_exception.dart';

class ApiResponse<T> {
  ApiResponse._();

  factory ApiResponse.success(T data) = ApiSuccess<T>;

  factory ApiResponse.failure(int errorCode, AppException exception) = ApiFailure<T>;
}

class ApiSuccess<T> extends ApiResponse<T> {
  final T data;

  ApiSuccess(this.data) : super._();
}

class ApiFailure<T> extends ApiResponse<T> {
  final int errorCode;
  final AppException exception;

  ApiFailure(this.errorCode, this.exception) : super._();
}
