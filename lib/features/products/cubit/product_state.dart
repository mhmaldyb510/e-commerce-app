part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductCubitInitial extends ProductState {}

final class ProductsLoadingState extends ProductState {}

final class ProductsLoadedState extends ProductState {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  ProductsLoadedState({required this.products, required this.categories});
}

final class ProductsErrorState extends ProductState {
  final String message;
  ProductsErrorState(this.message);
}

final class ProductFilteredState extends ProductState {
  final List<ProductModel> products;
  ProductFilteredState({required this.products});
}

final class FilterModalSheetState extends ProductState {}
