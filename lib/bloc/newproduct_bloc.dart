import 'package:bloc/bloc.dart';
import 'package:block_basic_project/models/product_model.dart';
import 'package:block_basic_project/repo/reppository.dart';
import 'package:equatable/equatable.dart';

part 'newproduct_event.dart';
part 'newproduct_state.dart';

class NewproductBloc extends Bloc<NewProductsLoadedEvent, NewproductState> {
  final ProductRepository productRepository;
  NewproductBloc(this.productRepository) : super(NewproductloadingState()) {
    on<NewProductsLoadedEvent>((event, emit) async {
      try {
        emit(NewproductloadingState());

        var data = await productRepository.getProduct();
        emit(NewproductCompletionState(data));
      } catch (e) {
        emit(NewproductErrorState(e.toString()));
      }
    });
  }
}
