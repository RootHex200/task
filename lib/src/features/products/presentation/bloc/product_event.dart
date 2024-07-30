

import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductList extends ProductEvent {}

class IncrementProductQuantity extends ProductEvent {
  final int productId;

  IncrementProductQuantity({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class DecrementProductQuantity extends ProductEvent {
  final int productId;

  DecrementProductQuantity({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class SearchProductByName extends ProductEvent {
  final String query;

  SearchProductByName({required this.query});

  @override
  List<Object?> get props => [query];
}
