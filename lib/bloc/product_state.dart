part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> productsModel;

  const ProductLoadedState(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
