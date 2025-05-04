import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductCubitInitial());
  getProducts() async {
    emit(ProductsLoadingState());
    Dio dio = Dio();
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      List<dynamic> data = response.data as List<dynamic>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      emit(ProductsLoadedState(products));
    } on DioException catch (e) {
      log(e.toString());
      emit(ProductsErrorState(e.toString()));
    }
  }
}
