import 'package:dartz/dartz.dart';
import 'package:udemy_course/data/network/requests.dart';
import 'package:udemy_course/domain/models/models.dart';

import '../../data/network/failure.dart';

abstract class Repository {
 Future< Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
