

import 'package:equatable/equatable.dart';
import 'package:task/src/features/products/data/model/product_model.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final double totalPrice;
  final String quary;

  ProductLoaded({required this.products, required this.totalPrice,required this.quary});

  @override
  List<Object?> get props => [products, totalPrice,quary];
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}
