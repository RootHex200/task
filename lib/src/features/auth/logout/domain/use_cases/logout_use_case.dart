

import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/features/auth/logout/data/model/logout_model.dart';
import 'package:task/src/features/auth/logout/domain/repositories/logout_repository.dart';

class LogoutUseCase{
  LogoutUseCase({required this.logoutRepository});
  final LogoutRepository logoutRepository;

  Future<Either<ErrorModel,LogoutModel>> logout()async{
    return await logoutRepository.logout();
  }
}