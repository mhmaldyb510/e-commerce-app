import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/features/cart/view/widgets/custom_circler_button.dart';
import 'package:flutter/material.dart';

class QuantityControlPart extends StatefulWidget {
  final ValueChanged<int>? onQuantityChanged;
  final int? quantity;
  const QuantityControlPart({super.key, this.onQuantityChanged, this.quantity});

  @override
  State<QuantityControlPart> createState() => _QuantityControlPartState();
}

class _QuantityControlPartState extends State<QuantityControlPart> {
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    quantity = widget.quantity ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCirclerButton(
          padding: const EdgeInsets.all(6),
          backgroundColor: AppColors.kPrimaryColor,
          child: Icon(
            Icons.add,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 20,
          ),
          onPressed: () {
            setState(() => quantity++);
            widget.onQuantityChanged?.call(quantity);
          },
        ),
        const SizedBox(width: 16),
        Text(quantity.toString()),
        const SizedBox(width: 16),
        CustomCirclerButton(
          padding: const EdgeInsets.all(6),

          backgroundColor: AppColors.offColor,
          child: Icon(
            Icons.remove,
            color: Theme.of(context).hintColor,
            size: 20,
          ),
          onPressed: () {
            if (quantity > 1) {
              setState(() => quantity--);
              widget.onQuantityChanged?.call(quantity);
            }
          },
        ),
      ],
    );
  }
}
