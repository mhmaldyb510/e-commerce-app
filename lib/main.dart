import 'package:e_commerce_app/core/helpers/objectbox_helper.dart';
import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';

late ObjectBox objectbox;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}
