import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/cart/model/cart_product_model.dart';
import 'package:e_commerce_app/features/cart/view/widgets/cart_product_tile.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  const CartBody({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.kPrimaryColor.withAlpha(20),
              child: Text(
                '${S.of(context).youHave} 0 ${S.of(context).productsOnCart}',
                style: TextStyles.bodySmallRegular.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Divider(color: AppColors.grayscale100)),
        SliverList.separated(
          itemBuilder:
              (context, index) => CartProductTile(product: cartProducts[index]),
          separatorBuilder:
              (context, index) => const Divider(color: AppColors.grayscale100),
          itemCount: cartProducts.length,
        ),
        const SliverToBoxAdapter(child: Divider(color: AppColors.grayscale100)),
        const SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }
}
