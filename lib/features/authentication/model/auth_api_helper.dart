import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';

class AuthApiHelper {
  AuthApiHelper._();

  static Future<void> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    final Dio dio = Dio();
    Map<String, String> data = {
      'name': name,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'phone': phone,
    };
    try {
      Response response = await dio.post(
        '${AppConstants.baseUrl}/auth/signup',
        data: data,
      );

      if (response.data['message'] == 'success') {
        final Map<String, dynamic> data = response.data;
        final Map<String, dynamic> userInfo = data['user'];
        final String name = userInfo['name']!;
        final String email = userInfo['email']!;
        final String token = data['token'];
        await Storage.setUserData(name: name, email: email, token: token);
      }
    } catch (e) {
      if (e is DioException) {
        throw e.response!.data['message'];
      } else {
        rethrow;
      }
    }
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    final Dio dio = Dio();
    Map<String, String> data = {'email': email, 'password': password};
    try {
      Response response = await dio.post(
        '${AppConstants.baseUrl}/auth/signin',
        data: data,
      );
      if (response.data['message'] == 'success') {
        final Map<String, dynamic> data = response.data;
        final Map<String, dynamic> userInfo = data['user'];
        final String name = userInfo['name']!;
        final String email = userInfo['email']!;
        final String token = data['token'];
        await Storage.setUserData(name: name, email: email, token: token);
      }
    } catch (e) {
      if (e is DioException) {
        throw e.response!.data['message'];
      } else {
        rethrow;
      }
    }
  }
}
