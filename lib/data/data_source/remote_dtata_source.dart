import 'package:udemy_course/data/network/app_api.dart';
import 'package:udemy_course/data/network/requests.dart';
import 'package:udemy_course/data/response/response.dart';

abstract class ReomteDataSource {
  Future<AuthenticationsResponse> login(LoginRequest loginRequest);
}

class ReomteDataSourceImpl implements ReomteDataSource {
  final AppServicesClient _appServicesClient;
  ReomteDataSourceImpl(this._appServicesClient);
  @override
  Future<AuthenticationsResponse> login(LoginRequest loginRequest) async {
    return await _appServicesClient.login(
        loginRequest.email, loginRequest.password);
  }
}
