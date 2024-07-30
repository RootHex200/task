

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/products/data/model/product_model.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:task/src/features/products/presentation/bloc/product_event.dart';
import 'package:task/src/features/products/presentation/bloc/product_state.dart';

class ProductListPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
                  BlocProvider.of<ProductBloc>(context).add(SearchProductByName(query: query));
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
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
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: ListTile(
                                  
                                  title: Text(product.name!),
                                  subtitle: Text('\$${product.price.toString()}'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(DecrementProductQuantity(productId: product.id!));
                                        },
                                      ),
                                      Text('${product.productQuantity}'),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(IncrementProductQuantity(productId: product.id!));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform an action such as navigating to another page
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
