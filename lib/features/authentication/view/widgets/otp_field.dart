import 'dart:developer';

import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatefulWidget {
  final int length;

  const OtpField({super.key, required this.length});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final TextEditingController _otpController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    double unitWidth = MediaQuery.sizeOf(context).width / 4 - 20;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        // Todo: Handle validation 
        appContext: context,
        autoDisposeControllers: true,
        textStyle: TextStyles.heading5Bold.copyWith(
          color: AppColors.grayscale950,
          fontWeight: FontWeight.w700,
        ),
        length: widget.length,
        controller: _otpController,
        showCursor: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(4),
          fieldHeight: 60,
          fieldWidth: unitWidth,
          borderWidth: 1,
          activeBorderWidth: 1,
          selectedBorderWidth: 1,
          disabledBorderWidth: 1,
          inactiveBorderWidth: 1,
          selectedColor: AppColors.orange500,
          activeColor: Color(0xffE6E9EA),
          disabledColor: Color(0xffE6E9EA),
          inactiveColor: Color(0xffE6E9EA),
          activeFillColor: Color(0xffF9FAFA),
          selectedFillColor: Color(0xffF9FAFA),
          inactiveFillColor: Color(0xffF9FAFA),
        ),

        enableActiveFill: true,
        onChanged: (value) {
          log(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          return text?.isNotEmpty == true &&
              text!.characters.every((char) => '0123456789'.contains(char));
        },
      ),
    );
  }
}
