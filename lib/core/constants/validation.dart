import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Validation {
  Validation._();

  static String? emailValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterEmail;
    } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return S.of(context).pleaseEnterValidEmail;
    } else {
      return null;
    }
  }

  static String? passwordValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterPassword;
    } else if (value.length < 6) {
      return '${S.of(context).passwordShouldBeAtLeast} 6 ${S.of(context).characters}';
    } else {
      return null;
    }
  }

  static String? nameValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterName;
    } else if (value.length < 3) {
      return '${S.of(context).nameShouldBeAtLeast} 3 ${S.of(context).characters}';
    } else {
      return null;
    }
  }
}
