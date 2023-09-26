import 'package:block_basic_project/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Screen"),
        ),
        body:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(state.productModel[index].category.toString()),
                    subtitle: Text(state.productModel[index].price.toString()),
                    leading: Image.network(
                        state.productModel[index].image.toString()),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)));
              },
            );
          }
          return const SizedBox();
        }));
  }
}
