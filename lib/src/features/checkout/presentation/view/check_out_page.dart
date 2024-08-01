
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/checkout/data/model/checkout_product_model.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_event.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_state.dart';
import 'package:task/src/features/checkout/presentation/view/components/check_out_product_item_view.dart';
import 'package:task/src/utils/colors/app_colors.dart';
import 'package:task/src/utils/style/text_style.dart';

class CheckOutPage extends StatelessWidget {
  final List<Map<String,dynamic>> checkoutdata;
  final double totalPrice;
  const CheckOutPage({super.key,required this.checkoutdata,required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CheckoutBloc>(context).add(CheckoutProductLoadedEvent(checkoutProduct: checkoutdata,totalPrice: totalPrice));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout",style: appbarTextStyle,),
        centerTitle: true,
        backgroundColor: AppColors.primaryAppRedColor,
        actionsIconTheme:const IconThemeData(color: AppColors.primaryWhiteColor),
        iconTheme: const IconThemeData(color: AppColors.primaryWhiteColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                
                if (state is CheckoutProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } 
               if (state is CheckoutProductLoaded) {
                  List<CheckoutProductDataModel> checkoutdata=state.checkoutdata;
                  print(checkoutdata.length);
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: checkoutdata.length,
                          itemBuilder: (context, index) {
                            final product = checkoutdata[index];
                            return CheckoutProductItemView(product: product);
                          },
                        ),
                      ),
                                              Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Total: \$${state.totalPrice}',
                          style: fontsize17WithRedColorTextStyle,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
