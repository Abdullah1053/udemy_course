import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:udemy_course/app/constant.dart';
import 'package:retrofit/dio.dart';
import 'package:udemy_course/data/response/response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) = _AppServicesClient;
  @POST("/Customers/Login")
  Future<AuthenticationsResponse> login(
      @Field("email") String email, @Field("password") String password);
}
