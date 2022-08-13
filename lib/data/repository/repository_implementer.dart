// import 'package:dio/dio.dart';
import 'package:udemy_course/data/data_source/remote_dtata_source.dart';
import 'package:udemy_course/data/mapper/mapper.dart';
import 'package:udemy_course/data/network/error_handler.dart';
import 'package:udemy_course/data/network/network_info.dart';
import 'package:udemy_course/domain/models/models.dart';

import 'package:udemy_course/data/network/requests.dart';

import 'package:udemy_course/data/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  ReomteDataSource _reomteDataSource;
  NetworkingInfo _networkingInfo;

  RepositoryImpl(this._reomteDataSource, this._networkingInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkingInfo.inConnected) {
      //its connected to the internet its safe to call API

      try {
        final response = await _reomteDataSource.login(loginRequest);
        if (response.status == ApiInternalHandler.SUCCESS) {
          //succes
          //return data
          //return eathir right
          return Right(response.toDomain());
        } else {
          //failure -- busnise error
          //return eathir left
          return left(Failure(ApiInternalHandler.FAILURE,
              response.message ?? ResponseMessage.DFAULT_ERROR));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return internet connection error
      //return eathir left
      return left(DataSource.NO_INTERNET_CONECCTION.getFailure());
    }
  }
}
