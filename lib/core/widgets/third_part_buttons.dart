import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ThirdPartButtons extends StatelessWidget {
  final void Function()? onPressed;
  final Brand icon;
  final String text;

  const ThirdPartButtons({
    super.key,
    this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.offColor),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(15),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 53),
          Text(
            text,
            style: TextStyles.bodyBaseBold.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.grayscale950,
            ),
          ),
        ],
      ),
    );
  }
}
