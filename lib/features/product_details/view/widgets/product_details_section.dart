import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/product_details/model/feature_model.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/change_quantity_part.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/features_builder.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/review_section.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

int roundDownToNearestTen(int number) {
  return (number ~/ 10) * 10;
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyles.bodyBaseBold.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: 'EGP ${product.priceAfterDiscount}   ',
                    style: TextStyles.bodySmallBold.copyWith(
                      color: AppColors.orange500,
                    ),
                    children: [
                      TextSpan(
                        text: '${product.price} EGP',
                        style: TextStyles.bodySmallBold.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const ChangeQuantityPart(),
              ],
            ),
            const SizedBox(height: 8),
            ReviewSection(product: product),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyles.bodySmallRegular.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 16),
            FeaturesBuilder(
              features: [
                FeatureModel(
                  title: S.of(context).reviews,
                  value: product.rate.toString(),
                  icon: Image.asset(Assets.iconsFavourites),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
