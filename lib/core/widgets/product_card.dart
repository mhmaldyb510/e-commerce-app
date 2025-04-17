import 'dart:developer';
import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/favorite_button.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final String rate;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: .3),
          width: 2,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              log(constraints.maxHeight.toString());
              return Column(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    height: constraints.maxHeight * 128 / 237,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyles.bodyBaseRegular.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height:
                            18 /
                            14, // line-height is calculated as a ratio of font-size
                        letterSpacing: -0.17,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          //this will transform price from USD to EGP we will not need it if we use price set with EGP
                          'EGP ${(double.parse(price) * 50).toStringAsFixed(0)}',
                          style: TextStyles.bodyBaseRegular.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height:
                                18 /
                                14, // line-height is calculated as a ratio of font-size
                            letterSpacing: -0.17,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${(double.parse(price) * 50 * 1.4).toStringAsFixed(0)} EGP',
                          style: TextStyles.bodyBaseRegular.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            height:
                                18 /
                                11, // line-height is calculated as a ratio of font-size
                            letterSpacing: -0.17,
                            color: Theme.of(
                              context,
                            ).textTheme.bodySmall!.color?.withAlpha(153),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${S.of(context).reviews} ($rate) ⭐',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const Positioned(top: 8, right: 8, child: FavoriteButton()),
          Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: () {},
              child: Image.asset(Assets.iconsAddButton, width: 30, height: 30),
            ),
          ),
        ],
      ),
    );
  }
}
