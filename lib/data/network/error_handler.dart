import 'package:dio/dio.dart';
import 'package:udemy_course/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
      //dio error so its an error from the api response or from dio itself
    } else {
      failure = DataSource.DFAULT_ERROR.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusCode != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DFAULT_ERROR.getFailure();
      }
    // error.response.statusMessage
    // error.response.statusCode

    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DFAULT_ERROR.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONECCTION,
  DFAULT_ERROR
}

extension DataSourceEx on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
        break;
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
        break;
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
        break;
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
        break;
      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
        break;
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
        break;
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
        break;
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
        break;
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
        break;
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
        break;
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
        break;
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
        break;
      case DataSource.NO_INTERNET_CONECCTION:
        return Failure(ResponseCode.NO_INTERNET_CONECCTION,
            ResponseMessage.NO_INTERNET_CONECCTION);
        break;
      case DataSource.DFAULT_ERROR:
        return Failure(ResponseCode.DFAULT_ERROR, ResponseMessage.DFAULT_ERROR);
        break;
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; //succes with data
  static const int NO_CONTENT = 201; //sucess with no data
  static const int FORBIDDEN = 400; // failure , api request rejected
  static const int UNAUTORISED = 401; //user is not autherized
  static const int NOT_FOUND = 205;
  static const int BAD_REQUEST = 400; // failure api reject request
  static const int INTERNAL_SERVER_ERROR = 500; //failure crash in server side
  static const int DFAULT_ERROR = 520; //failure crash in server side

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONECCTION = -6;
  static const int UNKNOWN = -7;
}

class ResponseMessage {
  static const String SUCCESS = "SUCCESS"; //succes with data
  static const String NO_CONTENT = "NO_CONTENT"; //sucess with no data
  static const String FORBIDDEN = "FORBIDDEN"; // failure , api request rejected
  static const String UNAUTORISED = "UNAUTORISED"; //user is not autherized
  static const String NOT_FOUND = "not found "; //5
  static const String BAD_REQUEST = "BAD_REQUEST"; // failure api reject request
  static const String INTERNAL_SERVER_ERROR =
      "INTERNAL_SERVER_ERROR"; //failure crash in server side
  static const String DFAULT_ERROR =
      "low internet conection please try again later :) "; //failure crash in server side

  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";
  static const String CANCEL = "CANCEL";
  static const String RECIEVE_TIMEOUT = "RECIEVE_TIMEOUT";
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";
  static const String CACHE_ERROR = "CACHE_ERROR";
  static const String NO_INTERNET_CONECCTION = "NO_INTERNET_CONECCTION";
  static const String UNKNOWN = "UNKNOWN";
}
class ApiInternalHandler{
static const int SUCCESS=0;
static const int FAILURE=1;
}