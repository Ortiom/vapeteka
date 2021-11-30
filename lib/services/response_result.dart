import 'package:dio/dio.dart';

enum Status { success, loading, error }

class Result<T> {
  Result({
    this.data,
    this.errorText,
    this.status,
    this.statusCode,
  });

  final T? data;
  final String? errorText;
  final Status? status;
  final int? statusCode;
}

String handleError(dynamic error) {
  String errorDescription = "";
  if (error is DioError) {
    // ignore: unnecessary_cast
    DioError dioError = error as DioError;
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = ('error_cancel');
        break;
      case DioErrorType.connectTimeout:
        errorDescription = ('Время подключения истекло');
        break;
      case DioErrorType.other:
        errorDescription = ('Отсутствует подключение к интернету');
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = ('error_receive_timeout');
        break;
      case DioErrorType.response:
        if (dioError.response!.data['message'] != null) {
          errorDescription = (dioError.response!.data['message']);
        } else {
          errorDescription = ('error_unknown_response') +
              dioError.response!.statusCode.toString();
        }
        break;
      case DioErrorType.sendTimeout:
        errorDescription = ('error_send_timeout');
        break;
    }
  } else {
    errorDescription = ('error_unexpected');
  }

  return errorDescription;
}
