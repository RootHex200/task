import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/features/auth/login/data/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<ErrorModel, UserModel>> login(String email, String password);
}
