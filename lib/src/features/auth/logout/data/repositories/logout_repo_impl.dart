

import 'package:dartz/dartz.dart';
import 'package:network/network.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/core/network_client/request_handler.dart';
import 'package:task/src/features/auth/logout/data/model/logout_model.dart';
import 'package:task/src/features/auth/logout/domain/repositories/logout_repository.dart';
import 'package:task/src/utils/constant/constant.dart';

class LogoutRepoImple extends LogoutRepository{
  LogoutRepoImple({required this.client});
  final RestClient client;
  @override
  Future<Either<ErrorModel, LogoutModel>> logout()async {
    final token=await getToken();
    return await client.post(APIType.protected, "/logout",{},headers: {
      "Authorization":"Bearer $token"
    }).guard((data) => LogoutModel.fromjson(data));
  }

}