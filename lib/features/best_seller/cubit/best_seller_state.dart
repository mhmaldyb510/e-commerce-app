part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerSuccess extends BestSellerState {
  final List<ProductModel> products;

  BestSellerSuccess(this.products);
}

final class BestSellerError extends BestSellerState {
  final String message;

  BestSellerError(this.message);
}
