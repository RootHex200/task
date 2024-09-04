import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/products/data/model/product_model.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:task/src/features/products/presentation/bloc/product_event.dart';
import 'package:task/src/features/products/presentation/view/components/click_button._widget.dart';
import 'package:task/src/utils/colors/app_colors.dart';
import 'package:task/src/utils/common/widgets/space_widget.dart';
import 'package:task/src/utils/style/text_style.dart';

class ProductItemViewWidget extends StatelessWidget {
  final ProductModel product;
  const ProductItemViewWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: product.productQuantity!.toString());
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
          const VerticalSpace(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonClickWidgets(
                  onpress: () {
                    BlocProvider.of<ProductBloc>(context)
                        .add(IncrementProductQuantity(productId: product.id!));
                  },
                  icon: Icons.add),
              const HorizontalSpace(width: 10),
              Container(
                height: 30,
                width: 50,
                color: AppColors.primaryAppRedColor,
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) {
                    BlocProvider.of<ProductBloc>(context).add(
                        IncrementProductQuantity(
                            productId: product.id!,
                            quantity: int.parse(value)));
                  },
                ),
              ),
              const HorizontalSpace(width: 10),
              ButtonClickWidgets(
                  onpress: () {
                    BlocProvider.of<ProductBloc>(context)
                        .add(DecrementProductQuantity(productId: product.id!));
                  },
                  icon: Icons.remove),
              HorizontalSpace(width: 10),
              if (product.tradeOfferPrimary != null)
                Text(
                  "${product.extravalue == 0 ? "" : product.extravalue.toString()}",
                  style: fontsize17WithRedColorTextStyle,
                ),
            ],
          )
        ],
      ),
    );
  }
}
