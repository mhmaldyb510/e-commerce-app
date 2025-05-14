import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/models/product_model.dart';

class HomeScreensApi {
  static getAllProducts({String? sort, int? limit}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        '${AppConstants.baseUrl}/products?sort=-$sort&limit=$limit',
      );
      List<dynamic> data = response.data['data'] as List<dynamic>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return products;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
