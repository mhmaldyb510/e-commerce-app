import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/models/category_model.dart';
import 'package:e_commerce_app/core/models/product_model.dart';

class ProductsScreenApiHelper {
  static getCategories() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get('${AppConstants.baseUrl}/categories');
      List<dynamic> data = response.data['data'] as List<dynamic>;
      List<CategoryModel> categories =
          data.map((e) => CategoryModel.fromJson(e)).toList();
      return categories;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static getAllProducts({String? categoryId, String? sort}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        categoryId != null
            ? '${AppConstants.baseUrl}/products?category[in]=$categoryId&sort=$sort'
            : '${AppConstants.baseUrl}/products?sort=$sort',
      );
      List<dynamic> data = response.data['data'] as List<dynamic>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();

      return products;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
