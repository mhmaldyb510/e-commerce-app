import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/account/model/navigation_option.dart';
import 'package:flutter/material.dart';

class NavigationOptionTile extends StatelessWidget {
  final NavigationOption option;

  const NavigationOptionTile({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => option.route)),
      minTileHeight: 22,
      contentPadding: EdgeInsets.zero,
      leading: Icon(option.icon, size: 20, color: AppColors.kPrimaryColor),
      title: Text(
        option.title,
        style: TextStyles.bodySmallBold.copyWith(
          color: AppColors.grayscale400,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).textTheme.bodySmall!.color,
        size: 20,
      ),
    );
  }
}
