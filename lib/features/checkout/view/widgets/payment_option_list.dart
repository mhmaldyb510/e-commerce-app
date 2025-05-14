import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/features/checkout/model/payment_way_enum.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class PaymentOptionList extends StatelessWidget {
  final ValueChanged<PaymentWayEnum>? onSelected;
  const PaymentOptionList({super.key, this.onSelected});

  @override
  Widget build(BuildContext context) {
    List<String> children = [Brands.mastercard, Brands.visa];
    return Wrap(
      children: List.generate(
        children.length,
        (index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => onSelected!(PaymentWayEnum.values[index]),
              child: Container(
                height: 43,
                width: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.offColor),
                ),
                child: Transform.scale(
                  scale: 1.3,
                  child: Brand(children[index]),
                ),
              ),
            ),
            if (index != children.length - 1) const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
