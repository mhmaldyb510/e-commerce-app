import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentBottomNavBarItem customNaveBarIcon(
  BuildContext context, {
  required IconData activeIcon,
  required IconData unActiveIcon,
  required String title,
}) {
  Color color = Theme.of(context).scaffoldBackgroundColor;
  const Color disabledColor = AppColors.grayscale500;
  const Color activeColor = Color(0xff1E1E1E);

  return PersistentBottomNavBarItem(
    textStyle: TextStyles.bodyXSmallBold.copyWith(fontWeight: FontWeight.w600),
    contentPadding: 0,
    inactiveIcon: Icon(size: 20, unActiveIcon, color: disabledColor),
    title: ' $title',
    iconSize: 30,
    icon: CircleAvatar(
      backgroundColor: AppColors.kPrimaryColor,
      radius: 15,
      child: Icon(activeIcon, color: color, size: 20),
    ),
    activeColorPrimary: activeColor,
    activeColorSecondary: AppColors.kPrimaryColor,
  );
}
