import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:flutter/foundation.dart';

fakeData() async {
  Dio dio = Dio();
  try {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List<dynamic> data = response.data as List<dynamic>;
    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();
    debugPrint('data: $products');
    return products;
  } on DioException catch (e) {
    log(e.toString());
    rethrow;
  }
}
