import 'package:block_basic_project/bloc/newproduct_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewproductBloc>().add(NewProductsLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Screen"),
        ),
        body: BlocBuilder<NewproductBloc, NewproductState>(
            builder: (context, state) {
          if (state is NewproductloadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is NewproductCompletionState) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(state.productModels[index].category.toString()),
                    subtitle: Text(state.productModels[index].price.toString()),
                    leading: Image.network(
                        state.productModels[index].image.toString()),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)));
              },
            );
          } else if (state is NewproductErrorState) {
            return Center(
                child: Text(
              (state.error),
              style: const TextStyle(fontSize: 18),
            ));
          }
          return const SizedBox();
        }));
  }
}
