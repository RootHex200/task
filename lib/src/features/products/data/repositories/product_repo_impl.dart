

import 'package:dartz/dartz.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/core/network_client/request_handler.dart';
import 'package:task/src/features/products/data/model/product_model.dart';
import 'package:task/src/features/products/domain/repositories/product_repository.dart';
import 'package:task/src/utils/constant/constant.dart';

class ProductRepositoryImpl extends ProductRepository{
  ProductRepositoryImpl({required this.client});
  final RestClient client;
  @override
  Future<Either<ErrorModel, List<ProductModel>>> getProducts() async{
    final SharedPreferences prefs = await shared_preferences;
    final token=prefs.getString("token");
    return await client.get(APIType.protected, "/fg-with-stock",headers: {
      "Authorization":"Bearer $token"
    }).guard((data) => (data as List).map((e) => ProductModel.fromJson(e)).toList());
  }

}