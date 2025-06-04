import 'dart:developer';
import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/favorite_button.dart';
import 'package:e_commerce_app/features/product_details/cubit/product_page_cubit.dart';
import 'package:e_commerce_app/features/product_details/view/screens/item_details_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailsScreen(product: product),
            ),
          ),
      child: Container(
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
                    Hero(
                      tag: product.imagePath,
                      child: Container(
                        clipBehavior: Clip.none,
                        height: constraints.maxHeight * 128 / 237,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(product.imagePath),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        product.name,
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
                      child: Flexible(
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              !(product.priceAfterDiscount != null ||
                                      product.priceAfterDiscount != 0)
                                  ? 'EGP ${product.priceAfterDiscount} '
                                  : 'EGP ${product.price}',
                              style: TextStyles.bodyBaseRegular.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height:
                                    18 /
                                    14, // line-height is calculated as a ratio of font-size
                                letterSpacing: -0.17,
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.color,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              !(product.priceAfterDiscount != null ||
                                      product.priceAfterDiscount != 0)
                                  ? '${product.price} EGP'
                                  : '',
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
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 8,
                          left: 8,
                          top: 8,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${S.of(context).reviews} (${product.rate}) ⭐',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const Positioned(top: 8, right: 8, child: FavoriteButton()),
            BlocBuilder<ProductPageCubit, ProductPageState>(
              builder: (context, state) {
                return Positioned(
                  bottom: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () async {
                      context.read<ProductPageCubit>().setProductID(product.id);
                      await context.read<ProductPageCubit>().addProductToCart();
                    },
                    child:
                        (state is ProductPageLoading &&
                                context.read<ProductPageCubit>().productID ==
                                    product.id)
                            ? Center(
                              child: Transform.scale(
                                scale: 0.5,
                                child: const CircularProgressIndicator(),
                              ),
                            )
                            : Image.asset(
                              Assets.iconsAddButton,
                              width: 30,
                              height: 30,
                            ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
