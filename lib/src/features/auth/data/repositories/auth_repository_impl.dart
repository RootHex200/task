
import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/core/network_client/request_handler.dart';
import 'package:task/src/features/auth/data/model/user_model.dart';
import 'package:task/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:network/network.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient client;

  AuthRepositoryImpl({required this.client});

  @override
  Future<Either<ErrorModel, UserModel>> login(String email, String password) async {
    return await client.post(APIType.public, "/login", {"email":email,"password":password}).guard((data)=>UserModel.fromJson(data));
  }
}