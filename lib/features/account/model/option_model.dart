import 'package:flutter/material.dart';

abstract class OptionModel {
  final String title;
  final IconData icon;

  OptionModel({required this.title, required this.icon});
}
