import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/product_details/model/product_api_helps.dart';
import 'package:meta/meta.dart';

part 'product_page_state.dart';

class ProductPageCubit extends Cubit<ProductPageState> {
  ProductPageCubit() : super(ProductPageInitial());
  int quantity = 1;
  String productID = '';

  setProductID(String id) {
    productID = id;
    emit(ProductPageInitial());
  }

  addProductToCart() async {
    emit(ProductPageLoading());
    try {
      await ProductApiHelps.addProductToCart(
        productId: productID,
        quantity: quantity,
      );
    } catch (e) {
      emit(ProductPageError(message: e.toString()));
    }
    emit(ProductPageLoaded());
  }
}
