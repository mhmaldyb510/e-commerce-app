import 'dart:developer';

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
        log(token);
      }
    } catch (e) {
      if (e is DioException) {
        throw e.response!.data['message'];
      } else {
        rethrow;
      }
    }
  }

  static Future<void> forgetPassword({required String email}) async {
    final Dio dio = Dio();
    Map<String, String> data = {'email': email};
    try {
      Response response = await dio.post(
        '${AppConstants.baseUrl}/auth/forgotPasswords',
        data: data,
      );
      if (!(response.data['statusMsg'] == 'success')) {
        throw response.data['message'];
      }
    } catch (e) {
      if (e is DioException) {
        throw e.response!.data['message'];
      } else {
        rethrow;
      }
    }
  }

  static verifyCode({required String code}) async {
    final Dio dio = Dio();
    Map<String, String> data = {'resetCode': code};
    try {
      Response response = await dio.post(
        '${AppConstants.baseUrl}/auth/verifyResetCode',
        data: data,
      );
      if (!(response.data['status'] == 'Success')) {
        throw response.data['message'];
      }
    } catch (e) {
      if (e is DioException) {
        throw e.response!.data['message'];
      } else {
        rethrow;
      }
    }
  }

  static resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final Dio dio = Dio();
    Map<String, String> data = {'email': email, 'newPassword': newPassword};
    try {
      Response response = await dio.put(
        '${AppConstants.baseUrl}/auth/resetPassword',
        data: data,
      );
      if ((response.data['statusMsg'] == 'fail')) {
        throw response.data['message'];
      }
      try {} catch (e) {
        log('Error decoding token: $e');
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
