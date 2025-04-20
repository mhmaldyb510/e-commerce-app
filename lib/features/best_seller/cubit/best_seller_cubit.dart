import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/features/home/view/screens/home_screen.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());

  List<ProductModel> products = [];

  Future<void> getProducts() async {
    emit(BestSellerLoading());
    try {
      List<ProductModel> products = await fakeData();
      emit(BestSellerSuccess(products));
    } catch (e) {
      emit(BestSellerError(e.toString()));
    }
  }
}
