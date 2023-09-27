part of 'newproduct_bloc.dart';

sealed class NewproductState extends Equatable {
  const NewproductState();

  @override
  List<Object> get props => [];
}

final class NewproductInitial extends NewproductState {}

final class NewproductloadingState extends NewproductState {}

final class NewproductCompletionState extends NewproductState {
  final List<ProductModel> productModels;

  const NewproductCompletionState(this.productModels);
  @override
  List<Object> get props => [productModels];
}

final class NewproductErrorState extends NewproductState {
  final String error;

  const NewproductErrorState(this.error);
  @override
  List<Object> get props => [error];
}
