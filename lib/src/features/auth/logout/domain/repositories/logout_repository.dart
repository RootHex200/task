

import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/features/auth/logout/data/model/logout_model.dart';

abstract class LogoutRepository{

  Future<Either<ErrorModel,LogoutModel>> logout();
}