import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/features/checkout/model/payment_way_enum.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/select_payment_way_card.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({super.key});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectPaymentWayCard(
          title: S.of(context).paymentOnDelivery,
          details: S.of(context).deliveryFromPlace,
          fees: 40,
          value: PaymentWayEnum.cash,
          groupValue: context.read<CheckoutCubit>().paymentWay,
          onChanged: (p0) {
            setState(
              () =>
                  context.read<CheckoutCubit>().paymentWay =
                      p0 ?? PaymentWayEnum.cash,
            );
            debugPrint(context.read<CheckoutCubit>().paymentWay.toString());
          },
        ),
        const SizedBox(height: 8),
        SelectPaymentWayCard(
          title: S.of(context).buyNowAndPayLater,
          details: S.of(context).pleaseSelectPaymentMethod,
          fees: 0,
          value: PaymentWayEnum.online,
          groupValue: context.read<CheckoutCubit>().paymentWay,
          onChanged: (p0) {
            setState(
              () =>
                  context.read<CheckoutCubit>().paymentWay =
                      p0 ?? PaymentWayEnum.online,
            );
            debugPrint(context.read<CheckoutCubit>().paymentWay.toString());
          },
        ),
        const SizedBox(height: 100),
        CustomButton(
          text: S.of(context).next,
          onPressed: () {
            context.read<CheckoutCubit>().done.add(S.of(context).shipping);
            int index = context.read<CheckoutCubit>().pageIndex;
            context.read<CheckoutCubit>().changePageIndex(index + 1);
          },
        ),
      ],
    );
  }
}
