import 'package:dio/dio.dart';

class NetworkException implements Exception {
  String message;
  NetworkException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        message = 'Request to server was cancelled.';
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        message = 'Connection Timedouy with server.';
        break;
      case DioErrorType.DEFAULT:
        message = 'Request to server was cancelled.';
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = 'Received timout in connection with server.';
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = 'Send timeout in connection with server.';
        break;
      case DioErrorType.RESPONSE:
        message = _handleError(error.response.statusCode);
        break;

      default:
        message = "Something went wrong.";
        break;
    }
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
        break;
      case 404:
        return 'Requested resource was not found.';
        break;
      case 500:
        return 'Internal server error.';
        break;
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
