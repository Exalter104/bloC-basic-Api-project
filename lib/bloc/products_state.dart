part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

/* There is three(3) states of an application
1:Loading state,
2:Loaded state,
3:Error state,
NOTE(.-.for Calling-Api)
*/

final class ProductsInitial extends ProductsState {}

// Loading state using progress indicator,
final class ProductsLoadingState extends ProductsState {}

//Loaded state,
final class ProductsLoadedState extends ProductsState {
  final List<ProductModel> productModel;
  const ProductsLoadedState(this.productModel);
  @override
  List<Object> get props => [];
}

//Error state
final class ProductsErrorState extends ProductsState {
  final String errorMessage;

  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
