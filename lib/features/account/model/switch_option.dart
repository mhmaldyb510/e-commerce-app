import 'package:e_commerce_app/features/account/model/option_model.dart';

class SwitchOption extends OptionModel {
  SwitchOption({
    required super.title,
    required super.icon,
    required this.value,
  });

  bool value = false;
}
