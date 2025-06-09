import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';

class ProductApiHelps {
  static addProductToCart({
    required String productId,
    required int quantity,
  }) async {
    Dio dio = Dio();
    Map<String, String> data = {'productId': productId};
    String token = await Storage.getUserData().then((value) => value['token']!);
    Map<String, String> headers = {'token': token};

    try {
      Response response = await dio.post(
        '${AppConstants.baseUrl}/cart',
        options: Options(headers: headers),
        data: data,
      );
      if (!(response.data['status'] == 'success')) {
        throw Exception([response.data['message']]);
      }

      await updateQuantity(
        dio: dio,
        newQuantity: quantity - 1,
        productId: productId,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<int> getExistingQuantity({
    required Dio dio,
    required String productId,
  }) async {
    String token = await Storage.getUserData().then((value) => value['token']!);
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}/cart',
        options: Options(headers: {"token": token}),
      );

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        final products = response.data['data']['products'] as List<dynamic>;

        for (final product in products) {
          if (product['product']['id'] == productId) {
            return product['count'] as int;
          }
        }
      }
    } catch (e) {
      log('Error fetching cart: $e');
      rethrow;
    }

    return 0; // Product not found in cart
  }

  static Future<void> updateQuantity({
    required Dio dio,
    required String productId,
    required int newQuantity,
  }) async {
    try {
      // Step 1: Get the existing quantity
      final existingQuantity = await getExistingQuantity(
        dio: dio,
        productId: productId,
      );

      // Step 2: Add the new quantity to the existing one
      final updatedQuantity = existingQuantity + newQuantity;

      // Step 3 will handle the PUT request using this `updatedQuantity`

      log('Updated quantity to send: $updatedQuantity');
      // Step 3: Send PUT request to update quantity
      final updateUrl = '${AppConstants.baseUrl}/cart/$productId';

      String token = await Storage.getUserData().then(
        (value) => value['token']!,
      );

      final response = await dio.put(
        updateUrl,
        options: Options(headers: {"token": token}),
        data: {"count": updatedQuantity.toString()},
      );

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log('Quantity updated successfully');
      } else {
        log('Failed to update quantity: ${response.data}');
      }
    } catch (e) {
      log('Error updating quantity: $e');
    }
  }
}
