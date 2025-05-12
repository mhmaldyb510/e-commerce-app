import 'package:e_commerce_app/features/account/model/option_model.dart';
import 'package:flutter/widgets.dart';

class NavigationOption extends OptionModel {
  NavigationOption({
    required super.title,
    required super.icon,
    required this.route,
  });

  final Widget route;
}
