import 'package:block_basic_project/bloc/newproduct_bloc.dart';
import 'package:block_basic_project/repo/reppository.dart';
import 'package:block_basic_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // we calling loaded event
      create: (context) => NewproductBloc(ProductRepository()),
      child: MaterialApp(
          title: 'BloC Application',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen()),
    );
  }
}
