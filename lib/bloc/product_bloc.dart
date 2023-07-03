import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:learning_bloc/repo/poducts_repo.dart';
import '../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductsLoadedEvent, ProductState> {
  final ProductsRepo productsRepo;

  ProductBloc(this.productsRepo) : super(ProductLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var data = await productsRepo.getProducts();
        emit(ProductLoadedState(data));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
