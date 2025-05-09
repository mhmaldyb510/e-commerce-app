import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutTitlesList extends StatelessWidget {
  final List<String> titles;
  const CheckoutTitlesList({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            titles.length,
            (index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 11.5,
                  backgroundColor:
                      context.read<CheckoutCubit>().done.contains(titles[index])
                          ? AppColors.kPrimaryColor
                          : AppColors.grayscale50,
                  child:
                      context.read<CheckoutCubit>().done.contains(titles[index])
                          ? Icon(
                            Icons.check,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 15,
                          )
                          : Text(
                            (index + 1).toString(),
                            style: TextStyles.bodySmallBold.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                ),
                const SizedBox(width: 4),
                Text(
                  titles[index],
                  style:
                      context.read<CheckoutCubit>().done.contains(titles[index])
                          ? TextStyles.bodySmallBold.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.kPrimaryColor,
                          )
                          : TextStyles.bodySmallBold.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).hintColor,
                          ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
