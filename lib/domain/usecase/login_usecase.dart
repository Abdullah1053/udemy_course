import 'package:dartz/dartz.dart';
import 'package:udemy_course/data/network/failure.dart';
import 'package:udemy_course/domain/models/models.dart';
import 'package:udemy_course/domain/repository/repository.dart';
import 'package:udemy_course/domain/usecase/base_usecase.dart';

import '../../data/network/requests.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
