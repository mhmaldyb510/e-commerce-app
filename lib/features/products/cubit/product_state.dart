part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductCubitInitial extends ProductState {}

final class ProductsLoadingState extends ProductState {}

final class ProductsLoadedState extends ProductState {
  final List<ProductModel> products;
  ProductsLoadedState(this.products);
}

final class ProductsErrorState extends ProductState {
  final String message;
  ProductsErrorState(this.message);
}

final class FilterModalSheetState extends ProductState {}
