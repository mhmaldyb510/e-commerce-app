import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/home/view/screens/best_seller_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MostPopularRow extends StatelessWidget {
  const MostPopularRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).mostPopular,
          style: TextStyles.bodyBaseBold.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BestSellerScreen(),
                ),
              ),
          child: Text(
            S.of(context).more,
            style: TextStyles.bodySmallRegular.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
