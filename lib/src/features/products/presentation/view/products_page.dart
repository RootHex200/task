
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/products/data/model/product_model.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:task/src/features/products/presentation/bloc/product_event.dart';
import 'package:task/src/features/products/presentation/bloc/product_state.dart';
import 'package:task/src/features/checkout/presentation/view/check_out_page.dart';
import 'package:task/src/features/products/presentation/view/components/product_item_view_widget.dart';
import 'package:task/src/utils/colors/app_colors.dart';
import 'package:task/src/utils/common/widgets/custom_button_widget.dart';
import 'package:task/src/utils/constant/constant.dart';
import 'package:task/src/utils/debouncer.dart';
import 'package:task/src/utils/style/text_style.dart';

class ProductListPage extends StatefulWidget {

  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late TextEditingController searchController;
  late Debouncer debouncer;

  @override
  void initState() {
    searchController=TextEditingController();
    debouncer=Debouncer(millisecond: 500);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    debouncer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products",style: appbarTextStyle,),
        centerTitle: true,
        backgroundColor: AppColors.primaryAppRedColor,
        actionsIconTheme:const IconThemeData(color: AppColors.primaryWhiteColor),
    actions: <Widget>[
      PopupMenuButton<int>(
          onSelected: (item) =>0,
          itemBuilder: (context) => [
            const PopupMenuItem<int>(value: 0, child: Text('Logout')),
          ],
        ),
    
        ],
      ),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: CupertinoSearchTextField(
                controller: searchController,
                onChanged: (query){
                  debouncer.run(() {
                    BlocProvider.of<ProductBloc>(context).add(SearchProductByName(query: query));
                   });
                   
                },
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    List<ProductModel>? productList;
                    if((state).quary.isEmpty){
                     
                      productList=(state).products;
                    }else{
                      productList=(state).products.where((product) => product.name!.toLowerCase().contains(state.quary.toLowerCase().trim())).toList();
                    }
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              final product = productList![index];
                              return ProductItemViewWidget(product: product);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                            style: fontsize17WithRedColorTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: CustomButton(
                            
                            txt: "ORDER", ontap: (){
                                                        List<Map<String,dynamic>> data=(state).products.where((element) => element.productQuantity! >0).toList().map((e) => e.toJson()).toList();
                          
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPage(checkoutdata: data, totalPrice: state.totalPrice)));
                          }),
                        )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
