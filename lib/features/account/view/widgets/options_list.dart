import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/features/account/model/navigation_option.dart';
import 'package:e_commerce_app/features/account/model/option_model.dart';
import 'package:e_commerce_app/features/account/model/switch_option.dart';
import 'package:e_commerce_app/features/account/view/widgets/navigation_option_tile.dart';
import 'package:e_commerce_app/features/account/view/widgets/switch_option_tile.dart';

import 'package:flutter/material.dart';

class OptionsList extends StatelessWidget {
  final List<OptionModel> options;
  const OptionsList({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: options.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemBuilder: (context, index) {
        if (options[index] is SwitchOption) {
          return SwitchOptionTile(option: options[index] as SwitchOption);
        } else if (options[index] is NavigationOption) {
          return NavigationOptionTile(
            option: options[index] as NavigationOption,
          );
        } else {
          return const SizedBox.shrink(); // Handle other cases with a default widget
        }
      },
      separatorBuilder:
          (context, index) => const Divider(color: AppColors.grayscale100),
    );
  }
}
