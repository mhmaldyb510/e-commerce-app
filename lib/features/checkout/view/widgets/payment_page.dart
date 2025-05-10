import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/add_card_form.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/payment_option_list.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).choosePaymentMethod,
            style: TextStyles.bodySmallBold,
          ),
          const SizedBox(height: 13),
          Text(
            S.of(context).pleaseChoosePaymentMethod,
            style: TextStyles.bodySmallRegular.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(height: 13),
          PaymentOptionList(
            onSelected:
                (value) => setState(() {
                  context.read<CheckoutCubit>().changePaymentWay(value);
                  debugPrint(
                    BlocProvider.of<CheckoutCubit>(
                      context,
                    ).paymentWay.toString(),
                  );
                }),
          ),
          const SizedBox(height: 16),
          const AddCardForm(),
        ],
      ),
    );
  }
}
