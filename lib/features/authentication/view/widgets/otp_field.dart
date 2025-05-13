import 'dart:developer';

import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatefulWidget {
  final int length;

  const OtpField({super.key, required this.length});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double unitWidth = MediaQuery.sizeOf(context).width / widget.length - 20;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).enterCode;
          } else if (value.length < widget.length) {
            return S.of(context).enterCode;
          }
          return null;
        },
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
          activeColor: const Color(0xffE6E9EA),
          disabledColor: const Color(0xffE6E9EA),
          inactiveColor: const Color(0xffE6E9EA),
          activeFillColor: const Color(0xffF9FAFA),
          selectedFillColor: const Color(0xffF9FAFA),
          inactiveFillColor: const Color(0xffF9FAFA),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],

        enableActiveFill: true,
        onChanged: (value) {
          log(value);
          setState(() {
            context.read<AuthenticationCubit>().verificationCode = value;
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
