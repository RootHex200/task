


import 'package:dartz/dartz.dart';
import 'package:task/src/core/network_client/error_model.dart';
import 'package:task/src/features/products/data/model/product_model.dart';
import 'package:task/src/features/products/domain/repositories/product_repository.dart';

class ProductUseCase{
  ProductUseCase({required this.productRepository});
  final ProductRepository productRepository;

  Future<Either<ErrorModel, List<ProductModel>>> getproduct()async{


    return productRepository.getProducts();
  }
}