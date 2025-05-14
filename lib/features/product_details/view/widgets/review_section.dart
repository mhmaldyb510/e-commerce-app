import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/product_details_section.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text('⭐'),
        const SizedBox(width: 9),
        Text(
          product.rate.toString(),
          style: TextStyles.bodySmallBold.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        const SizedBox(width: 9),
        Text(
          '(${roundDownToNearestTen(product.ratingsQuantity)}+)',
          style: TextStyles.bodySmallRegular.copyWith(
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(width: 9),
        GestureDetector(
          onTap: () {
            //Todo: Navigate to reviews screen
          },
          child: Text(
            S.of(context).theReview,
            style: TextStyles.bodySmallBold.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
