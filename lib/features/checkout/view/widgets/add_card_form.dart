import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardForm extends StatefulWidget {
  const AddCardForm({super.key});

  @override
  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  TextEditingController cardExpiryDateController = TextEditingController();
  bool makeDefault = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: S.of(context).cardHolderName,
              validator:
                  (p0) => Validation.cardNameValidator(context, p0 ?? ''),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: S.of(context).cardNumber,
              validator:
                  (p0) => Validation.cardNumberValidator(context, p0 ?? ''),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: S.of(context).expiryDate,
                    controller: cardExpiryDateController,
                    validator:
                        (p0) => Validation.expiryDateValidator(
                          context,
                          (p0 ?? '').replaceAll('/', ''),
                        ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      if (value.length >= 2) {
                        cardExpiryDateController.text =
                            '${value.substring(0, 2)}/${value.substring(2)}';
                      }

                      cardExpiryDateController
                          .selection = TextSelection.fromPosition(
                        TextPosition(
                          offset: cardExpiryDateController.text.length,
                        ),
                      );
                      if (cardExpiryDateController.text.length > 5) {
                        cardExpiryDateController.text = cardExpiryDateController
                            .text
                            .substring(0, 5);
                        cardExpiryDateController
                            .selection = TextSelection.fromPosition(
                          const TextPosition(offset: 5),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'CVV',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator:
                        (p0) => Validation.cvvValidator(context, p0 ?? ''),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  makeDefault = !makeDefault;
                });
              },
              child: Row(
                children: [
                  Checkbox(
                    value: makeDefault,
                    onChanged: (p0) {
                      setState(() {
                        makeDefault = p0 ?? false;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  Text(
                    S.of(context).makeAsDefaultCard,
                    style: TextStyles.bodySmallBold.copyWith(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: S.of(context).confirmTheOrder,
              onPressed: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    BlocProvider.of<CheckoutCubit>(
                      context,
                    ).done.add(S.of(context).payment);
                    BlocProvider.of<CheckoutCubit>(context).pageIndex++;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
