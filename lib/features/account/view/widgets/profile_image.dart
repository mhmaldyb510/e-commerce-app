import 'dart:ui';

import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        const CircleAvatar(
          radius: 36.5,
          backgroundImage: AssetImage(Assets.enter),
        ),
        Positioned(
          bottom: -16,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 16,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor
                  .withValues(colorSpace: ColorSpace.extendedSRGB),
              child: const Icon(
                IconlyLight.camera,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
