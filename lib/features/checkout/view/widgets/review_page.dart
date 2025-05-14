import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/features/checkout/model/payment_way_enum.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/edit_button.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var element in BlocProvider.of<CheckoutCubit>(context).products) {
      totalPrice += element.price;
    }
    return SingleChildScrollView(
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).orderSummary, style: TextStyles.bodySmallBold),
              const SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).subtotal,
                    style: TextStyles.bodySmallRegular.copyWith(
                      color: AppColors.grayscale500,
                    ),
                  ),
                  Text(
                    '$totalPrice ${S.of(context).egyptianPound}',
                    style: TextStyles.bodySmallBold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).shipping,
                    style: TextStyles.bodySmallRegular.copyWith(
                      color: AppColors.grayscale500,
                    ),
                  ),
                  Text(
                    '30 ${S.of(context).egyptianPound}',
                    style: TextStyles.bodySmallBold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.grayscale500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(
                color: AppColors.grayscale300,
                endIndent: 32,
                indent: 32,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).total, style: TextStyles.bodyBaseBold),
                  Text(
                    '${(totalPrice + 30).toStringAsFixed(0)} ${S.of(context).egyptianPound}',
                    style: TextStyles.bodyBaseBold,
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Text(
                S.of(context).pleaseConfirmYourOrder,
                style: TextStyles.bodySmallBold,
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).paymentMethod,
                    style: TextStyles.bodySmallBold,
                  ),
                  EditButton(
                    onTap: () {
                      context.read<CheckoutCubit>().done.remove(
                        S.of(context).payment,
                      );

                      context.read<CheckoutCubit>().changePageIndex(2);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    context.read<CheckoutCubit>().cardNumber.toString(),
                    style: TextStyles.bodyBaseBold.copyWith(
                      color: AppColors.grayscale500,
                    ),
                  ),
                  const SizedBox(width: 29),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.offColor),
                    ),
                    child: Brand(switch (BlocProvider.of<CheckoutCubit>(
                      context,
                    ).paymentWay) {
                      PaymentWayEnum.applePay => Brands.apple_pay,
                      PaymentWayEnum.visa => Brands.visa,
                      PaymentWayEnum.mastercard => Brands.mastercard,
                      PaymentWayEnum.paypal => Brands.paypal,
                    }, size: 53),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).shippingAddress,
                    style: TextStyles.bodySmallBold,
                  ),
                  EditButton(
                    onTap: () {
                      context.read<CheckoutCubit>().done.remove(
                        S.of(context).address,
                      );
                      context.read<CheckoutCubit>().changePageIndex(1);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Iconsax.location_outline,
                    color: AppColors.grayscale500,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    context.read<CheckoutCubit>().fullAddress,
                    style: TextStyles.bodyBaseRegular.copyWith(
                      color: AppColors.grayscale500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 51),
              CustomButton(text: S.of(context).placeOrder, onPressed: () {}),
            ],
          );
        },
      ),
    );
  }
}
