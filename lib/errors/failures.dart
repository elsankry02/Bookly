import 'package:dio/dio.dart';

abstract class Failuer {
  final String errorMessage;

  Failuer(this.errorMessage);
}

class ServerFailuer extends Failuer {
  ServerFailuer(super.errorMessage);

  factory ServerFailuer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer(' Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailuer(' Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer(' Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailuer(
            ' This is probably not the site you are looking for ! ');
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailuer(' Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailuer(
            'Connection internet was an error please try again !');
      case DioExceptionType.unknown:
        return ServerFailuer('Message not found');
    }
  }
  factory ServerFailuer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(response['error']['message']);
    }
    if (statusCode == 404) {
      return ServerFailuer('Your request not found, please try later !');
    }
    if (statusCode == 500) {
      return ServerFailuer('Internal server error, please try later !');
    } else {
      return ServerFailuer('Oops There was an error, please try later !');
    }
  }
}
