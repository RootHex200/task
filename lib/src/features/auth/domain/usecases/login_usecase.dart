


import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/features/auth/data/model/user_model.dart';
import 'package:task/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  LoginUsecase({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either<ErrorModel, UserModel>> login(String email, String password)async{
    return await authRepository.login(email, password);
  }

}