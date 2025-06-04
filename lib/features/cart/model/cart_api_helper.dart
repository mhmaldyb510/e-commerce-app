import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/features/cart/model/cart_product_model.dart';

class CartApiHelper {
  static getCartProducts() async {
    Dio dio = Dio();
    String token = await Storage.getUserData().then((value) => value['token']!);
    Map<String, String> headers = {'token': token};
    try {
      Response response = await dio.get(
        '${AppConstants.baseUrl}/cart',
        options: Options(headers: headers),
      );
      Map<String, dynamic> data = response.data['data'] as Map<String, dynamic>;
      List jsonProducts = data['products'] as List;
      List<CartProductModel> products =
          jsonProducts.map((e) => CartProductModel.fromJson(e)).toList();
      log(products.toString());
      return products;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static deleteProductFromCart(String productId) async {
    Dio dio = Dio();
    String token = await Storage.getUserData().then((value) => value['token']!);
    Map<String, String> headers = {'token': token};
    try {
      await dio.delete(
        '${AppConstants.baseUrl}/cart/$productId',
        options: Options(headers: headers),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
