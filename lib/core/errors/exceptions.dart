import 'package:climb_up/core/errors/models/error_news_model.dart';
import 'package:climb_up/core/errors/models/error_regiester_model.dart';
import 'package:dio/dio.dart';

class ServerRegesterException implements Exception {
  final ErrorRegesterModel errModel;

  ServerRegesterException({required this.errModel});
}

void handleRegesterDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerRegesterException(
          errModel: ErrorRegesterModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerRegesterException(
              errModel: ErrorRegesterModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerRegesterException(
              errModel: ErrorRegesterModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerRegesterException(
              errModel: ErrorRegesterModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerRegesterException(
              errModel: ErrorRegesterModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw ServerRegesterException(
              errModel: ErrorRegesterModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerRegesterException(
              errModel: ErrorRegesterModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerRegesterException(
              errModel: ErrorRegesterModel(
                  status: 504, errorMessage: 'Server connectivity issues'));
      }
  }
}

class ServerNewsExceptions implements Exception {
  final ErrorNewsModel errModel;

  ServerNewsExceptions({required this.errModel});
}

void handleNewsDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel(
              code: 'by me', status: '0', message: 'connectionError'));
    case DioExceptionType.unknown:
      throw ServerNewsExceptions(
          errModel: ErrorNewsModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerNewsExceptions(
              errModel: ErrorNewsModel.fromJson(e.response!.data));
      }
  }
}
