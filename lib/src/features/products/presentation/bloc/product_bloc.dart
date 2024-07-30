

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/products/domain/use_cases/product_usecase.dart';
import 'package:task/src/features/products/presentation/bloc/product_event.dart';
import 'package:task/src/features/products/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;

  ProductBloc({required this.productUseCase}) : super(ProductInitial()) {
    on<GetProductList>((event, emit) async {
      emit(ProductLoading());
      final result=await productUseCase.getproduct();
      result.fold((error) => emit(ProductError(message: error.message!)), (data) => emit(ProductLoaded(products: data, totalPrice: 0.0,quary: "")));
    });

    on<IncrementProductQuantity>((event, emit) async {
      if (state is ProductLoaded) {

        //totalprice state value of those product that products quantity gratter then zero
        double totalPrice=(state as ProductLoaded).totalPrice;

        final updatedProducts = (state as ProductLoaded).products.map((product) {
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

        emit(ProductLoaded(products: updatedProducts, totalPrice: totalPrice,quary: (state as ProductLoaded).quary));
      }
    });

    on<DecrementProductQuantity>((event, emit) async {
      if (state is ProductLoaded) {
        //totalprice stae value of those product that products quantity gratter then zero
        double totalPrice=(state as ProductLoaded).totalPrice;

        final updatedProducts = (state as ProductLoaded).products.map((product) {
          if (product.id == event.productId && product.productQuantity! > 0) {

            //update product quantity of specific product which clicked by user
            int quantity=product.productQuantity!-1;
            //update totalprice state value of  specific product with help of product quantity which clicked by user
            totalPrice=totalPrice-double.parse(product.price!);
            //update product quantity value by copywith function 
            return product.copyWith(productQuantity: quantity);
          }
          return product;
        }).toList();

        emit(ProductLoaded(products: updatedProducts, totalPrice: totalPrice,quary: (state as ProductLoaded).quary));
      }
    });

    on<SearchProductByName>((event, emit) async {
      if (state is ProductLoaded) {
        // print(event.query.toString());
        emit(ProductLoaded(products: (state as ProductLoaded).products, totalPrice: (state as ProductLoaded).totalPrice,quary: event.query.toLowerCase().trim()));
      }
    });
  }

}
