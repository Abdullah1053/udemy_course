import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:udemy_course/app/app_prefrence.dart';
import 'package:udemy_course/app/constant.dart';

const String APPLICATION_JSON = "Application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "Accept";
const String AUTHERIZATION = "Autherization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPrefrences _appPrefrences;
  DioFactory(this._appPrefrences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPrefrences.getAppLanguage();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHERIZATION: Constants.token,
      DEFAULT_LANGUAGE: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: Constants.API_TIME_OUT,
      sendTimeout: Constants.API_TIME_OUT,
    );
    if (kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    } else {}

    return dio;
  }
}
