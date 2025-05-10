import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class EditButton extends StatelessWidget {
  final void Function()? onTap;

  const EditButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Iconsax.edit_2_outline,
            color: AppColors.grayscale500,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            S.of(context).edit,
            style: TextStyles.bodySmallBold.copyWith(
              color: AppColors.grayscale500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
