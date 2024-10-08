import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/auth/login/presentation/pages/auth_login_screen.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_bloc.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_event.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_state.dart';
import 'package:task/src/features/products/data/model/product_model.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:task/src/features/products/presentation/bloc/product_event.dart';
import 'package:task/src/features/products/presentation/bloc/product_state.dart';
import 'package:task/src/features/checkout/presentation/view/check_out_page.dart';
import 'package:task/src/features/products/presentation/view/components/product_item_view_widget.dart';
import 'package:task/src/utils/colors/app_colors.dart';
import 'package:task/src/utils/common/widgets/custom_button_widget.dart';
import 'package:task/src/utils/common/widgets/success_dialog_widget.dart';
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

  // String dropdownvalue = 'Item 1';

  // // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];
  @override
  void initState() {
    searchController = TextEditingController();
    debouncer = Debouncer(millisecond: 500);
    BlocProvider.of<ProductBloc>(context).add(GetProductList());
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
        title: const Text(
          "Products",
          style: appbarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryAppRedColor,
        actionsIconTheme:
            const IconThemeData(color: AppColors.primaryWhiteColor),
        actions: <Widget>[
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LougutSuccessState) {
                successDialog(context, state.data!);
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                });
              }
            },
            child: PopupMenuButton<int>(
              onSelected: (item) => 0,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    onTap: () {
                      BlocProvider.of<LogoutBloc>(context)
                          .add(LogoutInitialEvent());
                      BlocProvider.of<LogoutBloc>(context)
                          .add(ClickLogoutEvent());
                    },
                    value: 0,
                    child: const Text('Logout')),
              ],
            ),
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CupertinoSearchTextField(
                controller: searchController,
                onChanged: (query) {
                  debouncer.run(() {
                    BlocProvider.of<ProductBloc>(context)
                        .add(SearchProductByName(query: query));
                  });
                },
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  List<String> listdata = [];
                  for (int i = 0; i < (state).products.length; i++) {
                    listdata.add(state.products[i].name.toString());
                  }
                  String dropdownvalue = listdata[0];
                  return DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: listdata.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  );
                }
                return Container();
              },
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
                    if ((state).quary.isEmpty) {
                      productList = (state).products;
                    } else {
                      productList = (state)
                          .products
                          .where((product) => product.name!
                              .toLowerCase()
                              .contains(state.quary.toLowerCase().trim()))
                          .toList();
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomButton(
                              txt: "ORDER",
                              ontap: () {
                                List<Map<String, dynamic>> data = (state)
                                    .products
                                    .where((element) =>
                                        element.productQuantity! > 0)
                                    .toList()
                                    .map((e) => e.toJson())
                                    .toList();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckOutPage(
                                            checkoutdata: data,
                                            totalPrice: state.totalPrice)));
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
