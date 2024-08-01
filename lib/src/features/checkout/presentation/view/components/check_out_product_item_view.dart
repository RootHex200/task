

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/checkout/data/model/checkout_product_model.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_event.dart';
import 'package:task/src/features/products/presentation/view/components/click_button._widget.dart';
import 'package:task/src/utils/colors/app_colors.dart';
import 'package:task/src/utils/common/widgets/space_widget.dart';
import 'package:task/src/utils/style/text_style.dart';

class CheckoutProductItemView extends StatelessWidget {
  final CheckoutProductDataModel product;
  const CheckoutProductItemView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: AppColors.primaryAppRedColor, style: BorderStyle.solid)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name!,
            style: fontsize17WithBlackColorTextStyle,
          ),
          const VerticalSpace(height: 8),
          Row(
            children: [
              const Text(
                "Price: ",
                style: fontsize17WithGrayColorTextStyle,
              ),
              Text(
                product.price!,
                style: fontsize17WithBlackColorTextStyle,
              )
            ],
          ),
          const VerticalSpace(height: 8),
          Row(
            children: [
              const Text(
                "Stock: ",
                style: fontsize17WithGrayColorTextStyle,
              ),
              Text(
                product.stockQty!,
                style: fontsize17WithBlackColorTextStyle,
              )
            ],
          ),
          const VerticalSpace(height: 8),
          Row(
            children: [
              const Text(
                "Master Pack: ",
                style: fontsize17WithGrayColorTextStyle,
              ),
              Text(
                product.packSize!,
                style: fontsize17WithBlackColorTextStyle,
              )
            ],
          ),
                    Row(
            children: [
               Text(
                "Total (${product.price!}x${product.productQuantity!}): ",
                style: fontsize17WithRedColorTextStyle,
              ),
              Text(
                (double.parse(product.price!)*product.productQuantity!).toString(),
                style: fontsize17WithBlackColorTextStyle,
              )
            ],
          ),
          const VerticalSpace(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                
                children: [
                  ButtonClickWidgets(
                      onpress: () {
                        BlocProvider.of<CheckoutBloc>(context)
                            .add(CheckoutProductIncreaseQuantity(productId: product.id!));
                      },
                      icon: Icons.add),
                  const HorizontalSpace(width: 10),
                   Text(
                    product.productQuantity!.toString(),
                    style: fontsize17WithRedColorTextStyle,
                  ),
                  const HorizontalSpace(width: 10),
                  ButtonClickWidgets(
                      onpress: () {
                        BlocProvider.of<CheckoutBloc>(context)
                            .add(CheckoutProductDecreaseQuantity(productId: product.id!));
                      },
                      icon: Icons.remove),
                ],
              ),
              GestureDetector(
                onTap: (){
                  BlocProvider.of<CheckoutBloc>(context).add(RemoveChekoutProduct(productId: product.id!));
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: AppColors.primaryAppRedColor,
                  child: const Icon(Icons.delete,color: AppColors.primaryWhiteColor,size: 25,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
