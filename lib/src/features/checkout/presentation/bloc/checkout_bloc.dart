

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/checkout/data/model/checkout_product_model.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_event.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutStateInitial()) {

    on<CheckoutProductLoadedEvent>((event, emit) {
      emit(CheckoutProductLoading());
      List<CheckoutProductDataModel> data=event.checkoutProduct.map((e)=>CheckoutProductDataModel.fromJson(e)).toList();
      emit(CheckoutProductLoaded(checkoutdata: data,totalPrice: event.totalPrice));
    });
    
    on<CheckoutProductIncreaseQuantity>((event,emit){
      if(state is CheckoutProductLoaded){
        //totalprice state value of those product that products quantity gratter then zero
        double totalPrice=(state as CheckoutProductLoaded).totalPrice;

        final updatedProducts = (state as CheckoutProductLoaded).checkoutdata.map((product) {
          if (product.id == event.productId) {

            //update product quantity of specific product which clicked by user
            int quantity=product.productQuantity!+1;

            //update totalprice state value of  specific product with help of product quantity which clicked by user
            totalPrice=totalPrice+double.parse(product.price!);

            //update product quantity value by copywith function 
            return product.copyWith(productQuantity: quantity);
          }
          return product;
        }).toList();
        emit(CheckoutProductLoaded(checkoutdata: updatedProducts, totalPrice: totalPrice));
      }
    });

    on<CheckoutProductDecreaseQuantity>((event,emit){
      if(state is CheckoutProductLoaded){
        //totalprice state value of those product that products quantity gratter then zero
        double totalPrice=(state as CheckoutProductLoaded).totalPrice;

        final updatedProducts = (state as CheckoutProductLoaded).checkoutdata.map((product) {
          if (product.id == event.productId && product.productQuantity! > 1) {

            //update product quantity of specific product which clicked by user
            int quantity=product.productQuantity!-1;

            //update totalprice state value of  specific product with help of product quantity which clicked by user
            totalPrice=totalPrice-double.parse(product.price!);

            //update product quantity value by copywith function 
            return product.copyWith(productQuantity: quantity);
          }
          return product;
        }).toList();
        emit(CheckoutProductLoaded(checkoutdata: updatedProducts, totalPrice: totalPrice));
      }
    });

    on<RemoveChekoutProduct>((event,emit){
      print(event.productId);
      if(state is CheckoutProductLoaded){
        double checkoutproducttotalprice=(state as CheckoutProductLoaded).totalPrice;
        List<CheckoutProductDataModel> checkoutProductDataModel=[];
        for(CheckoutProductDataModel data in (state as CheckoutProductLoaded).checkoutdata){
          if(data.id==event.productId){
            double removeproductelementprice=double.parse(data.price!)*data.productQuantity!;
            checkoutproducttotalprice=checkoutproducttotalprice-removeproductelementprice;
          }
          if(data.id!=event.productId){
            checkoutProductDataModel.add(data);
          }
        }
        // (state as CheckoutProductLoaded).checkoutdata.removeWhere((element) {
        //   if(element.id==event.productId){

        //     //calculate remove proudct price and update
            // double removeproductelementprice=double.parse(element.price!)*element.productQuantity!;
            // checkoutproducttotalprice=checkoutproducttotalprice-removeproductelementprice;
            // print(checkoutproducttotalprice);
        //   }
        //   return element.id==event.productId;
        // });
        print((state as CheckoutProductLoaded).checkoutdata);
        emit(CheckoutProductLoaded(checkoutdata: checkoutProductDataModel, totalPrice: checkoutproducttotalprice));
      }
    });
  }
}