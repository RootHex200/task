

import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/features/products/data/model/product_model.dart';

abstract class ProductRepository {
  Future<Either<ErrorModel, List<ProductModel>>> getProducts();
}