import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/features/home/model/home_screen_api.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<ProductModel> products = [];

  getHomeData({int? limit}) async {
    emit(HomeLoading());
    try {
      List<ProductModel> products = await HomeScreensApi.getAllProducts(
        sort: 'sold',
        limit: limit,
      );
      this.products = products;
      emit(HomeLoaded());
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
