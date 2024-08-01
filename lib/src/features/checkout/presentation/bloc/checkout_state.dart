

import 'package:equatable/equatable.dart';
import 'package:task/src/features/checkout/data/model/checkout_product_model.dart';

abstract class CheckoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckoutStateInitial extends CheckoutState {}

class CheckoutProductLoading extends CheckoutState {}

class CheckoutProductLoaded extends CheckoutState{
  final List<CheckoutProductDataModel> checkoutdata;
  final double totalPrice;

  CheckoutProductLoaded({required this.checkoutdata,required this.totalPrice});

  @override
  List<Object?> get props => [checkoutdata,totalPrice];
}
