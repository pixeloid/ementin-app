import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ementin_flutter/models/error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError(String reason) =
      InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess(String error) =
      UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    ErrorModel? errorModel;

    try {
      errorModel = ErrorModel.fromJson(response?.data, response?.statusCode);
      // ignore: empty_catches
    } catch (e) {}

    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest(
            errorModel?.statusMessage ?? "Not found");
      case 404:
        return NetworkExceptions.notFound(
            errorModel?.statusMessage ?? "Not found");
      case 409:
        return const NetworkExceptions.conflict();
      case 422:
        return NetworkExceptions.unableToProcess(
            errorModel?.description ?? "Hiba a feldolgozás közben");
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 500:
        return NetworkExceptions.internalServerError(errorModel!.description);
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.unexpectedError();
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess(error.toString());
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    if (networkExceptions is NotImplemented) {
      return "Not Implemented";
    } else if (networkExceptions is RequestCancelled) {
      return "Request Cancelled";
    } else if (networkExceptions is InternalServerError) {
      return networkExceptions.reason;
    } else if (networkExceptions is NotFound) {
      return networkExceptions.reason;
    } else if (networkExceptions is ServiceUnavailable) {
      return "Service unavailable";
    } else if (networkExceptions is MethodNotAllowed) {
      return "Method Allowed";
    } else if (networkExceptions is BadRequest) {
      return "Bad request";
    } else if (networkExceptions is UnauthorizedRequest) {
      return networkExceptions.reason;
    } else if (networkExceptions is UnexpectedError) {
      return "Unexpected error occurred";
    } else if (networkExceptions is RequestTimeout) {
      return "Connection request timeout";
    } else if (networkExceptions is NoInternetConnection) {
      return "No internet connection";
    } else if (networkExceptions is Conflict) {
      return "Error due to a conflict";
    } else if (networkExceptions is SendTimeout) {
      return "Send timeout in connection with API server";
    } else if (networkExceptions is UnableToProcess) {
      return networkExceptions.error;
    } else if (networkExceptions is DefaultError) {
      return networkExceptions.error;
    } else if (networkExceptions is FormatException) {
      return "Unexpected error occurred";
    } else if (networkExceptions is NotAcceptable) {
      return "Not acceptable";
    } else {
      return "Unknown error occurred";
    }
  }
}
