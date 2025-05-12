import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<void> setUserData({
    required String name,
    required String email,
  }) async {
    await Future.wait([
      storage.write(key: 'name', value: name),
      storage.write(key: 'email', value: email),
    ]);
  }

  static Future<Map<String, String?>> getUserData() async {
    List<String?> data = await Future.wait([
      storage.read(key: 'name'),
      storage.read(key: 'email'),
    ]);
    return {'name': data[0], 'email': data[1]};
  }
}
