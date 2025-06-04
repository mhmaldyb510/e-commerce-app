part of 'product_page_cubit.dart';

@immutable
sealed class ProductPageState {}

final class ProductPageInitial extends ProductPageState {}

final class ProductPageLoading extends ProductPageState {}

final class ProductPageLoaded extends ProductPageState {}

final class ProductPageError extends ProductPageState {
  final String message;
  ProductPageError({required this.message});
}