part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

// is Loaded event occured ? yes.
class ProductsLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
