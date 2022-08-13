import 'package:analyzer/dart/ast/ast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkingInfo {
  Future<bool> get inConnected;
}

class NetworkingInfoImpl implements NetworkingInfo {
  
  final InternetConnectionChecker _internetConnectionChecker;
  
  NetworkingInfoImpl(this._internetConnectionChecker);
  
  
  @override
  Future<bool> get inConnected => throw UnimplementedError();
}
