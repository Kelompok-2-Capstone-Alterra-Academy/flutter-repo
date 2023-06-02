import 'package:dio/dio.dart';

handleErrorApi(error) {
  String message = '';
  print(error);
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioErrorType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioErrorType.unknown:
        message = 'Connection to API server failed due to internet connection';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioErrorType.badResponse:
        switch (error.response!.statusCode) {
          case 400:
            message = 'Bad request';
            break;
          case 404:
            message = 'Requested resource not found';
            break;
          case 500:
            message = 'Internal server error';
            break;
          default:
            message =
                'Received invalid status code: ${error.response!.statusCode}';
            break;
        }
        break;
      default:
        message = 'Connection to API server failed due to internet connection';
    }
  } else {
    message = 'Connection to API server failed due to internet connection';
  }
  return {'status_code': error.response!.statusCode, 'message': message};
}
