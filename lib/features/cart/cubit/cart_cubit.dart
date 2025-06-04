import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/model/cart_api_helper.dart';
import 'package:e_commerce_app/features/cart/model/cart_product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartProductModel> products = [];

  getCartProducts() async {
    emit(CartLoading());
    try {
      products = await CartApiHelper.getCartProducts();
      emit(CartSuccess());
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  deleteProductFromCart(String productId) async {
    await CartApiHelper.deleteProductFromCart(productId);
    await getCartProducts();
  }
}
