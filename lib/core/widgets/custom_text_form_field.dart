import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;
  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      validator: widget.validator,

      decoration: InputDecoration(
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () => setState(() => obscureText = !obscureText),
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyles.bodySmallBold.copyWith(
          color: AppColors.grayscale400,
          fontWeight: FontWeight.w700,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE6E9EA)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
