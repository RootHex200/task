


import 'package:equatable/equatable.dart';

abstract class CheckoutEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class CheckoutProductLoadedEvent extends CheckoutEvent{
    final List<Map<String,dynamic>> checkoutProduct;
    final double totalPrice;
    CheckoutProductLoadedEvent({required this.checkoutProduct,required this.totalPrice});
}

class CheckoutProductIncreaseQuantity extends CheckoutEvent{
  final int productId;
   CheckoutProductIncreaseQuantity({required this.productId});
   
     @override
     List<Object?> get props => [productId];
   

}

class CheckoutProductDecreaseQuantity extends CheckoutEvent{
  final int productId;
   CheckoutProductDecreaseQuantity({required this.productId});
   
     @override
     List<Object?> get props => [productId];
  
}

class RemoveChekoutProduct extends CheckoutEvent{
    final int productId;
   RemoveChekoutProduct({required this.productId});
   
     @override
     List<Object?> get props => [productId];
}