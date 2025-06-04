import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/model/cart_product_model.dart';
import 'package:e_commerce_app/features/cart/view/widgets/quantity_control_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class CartProductTile extends StatelessWidget {
  final CartProductModel product;
  const CartProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SizedBox(
        height: 92,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Container(
              width: 73,
              height: 92,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.imageURL),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:
                      MediaQuery.sizeOf(context).width - (73 + 36 + 24 + 100),
                  child: Text(
                    product.name,
                    style: TextStyles.bodySmallBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.count.toString(),
                  style: TextStyles.bodySmallRegular.copyWith(
                    color: AppColors.orange500,
                  ),
                ),
                const SizedBox(height: 6),
                QuantityControlPart(
                  quantity: product.count,
                  onQuantityChanged: (quantity) {
                    //Todo: update quantity
                  },
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CartCubit>().deleteProductFromCart(product.id);
                  },
                  icon: const Icon(Iconsax.trash_outline, size: 20),
                ),
                const Spacer(),
                Text(
                  '${product.price} EGP',
                  style: TextStyles.bodyBaseBold.copyWith(
                    color: AppColors.orange500,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
