import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/custom_circler_button.dart';
import 'package:flutter/material.dart';

class ChangeQuantityPart extends StatefulWidget {
  const ChangeQuantityPart({super.key});

  @override
  State<ChangeQuantityPart> createState() => _ChangeQuantityPartState();
}

class _ChangeQuantityPartState extends State<ChangeQuantityPart> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCirclerButton(
          icon: Icons.add,
          backgroundColor: AppColors.kPrimaryColor,
          iconColor: Theme.of(context).scaffoldBackgroundColor,
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
        const SizedBox(width: 16),
        Text(
          '$quantity',
          style: TextStyles.bodyBaseBold.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        const SizedBox(width: 16),
        CustomCirclerButton(
          icon: Icons.remove,
          backgroundColor: AppColors.offColor,
          iconColor: Theme.of(context).hintColor,
          onPressed: () {
            setState(() {
              if (quantity > 1) {
                quantity--;
              }
            });
          },
        ),
      ],
    );
  }
}
