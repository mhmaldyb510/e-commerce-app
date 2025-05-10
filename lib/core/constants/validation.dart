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

  static String? confirmPasswordValidator(
    BuildContext context,
    String value,
    String password,
  ) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterPassword;
    } else if (value.length < 6) {
      return '${S.of(context).passwordShouldBeAtLeast} 6 ${S.of(context).characters}';
    } else if (value != password) {
      return S.of(context).passwordsDoNotMatch;
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

  static String? addressValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterAddress;
    } else {
      return null;
    }
  }

  static String? cityValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterCity;
    } else {
      return null;
    }
  }

  static String? apartmentValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterApartmentNumber;
    } else {
      return null;
    }
  }

  static String? cardNameValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterCardName;
    } else {
      return null;
    }
  }

  static String? cardNumberValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterCardNumber;
    } else if (value.length < 16) {
      return '${S.of(context).cardNumberShouldBeAtLeast} 16 ${S.of(context).characters}';
    } else {
      return null;
    }
  }

  static String? expiryDateValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterExpiryDate;
    } else if (value.length < 4) {
      return S.of(context).pleaseEnterValidExpiryDate;
    } else {
      return null;
    }
  }

  static String? cvvValidator(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).pleaseEnterCvv;
    } else if (value.length < 3) {
      return '${S.of(context).cvvShouldBeAtLeast} 3 ${S.of(context).characters}';
    } else {
      return null;
    }
  }
}
