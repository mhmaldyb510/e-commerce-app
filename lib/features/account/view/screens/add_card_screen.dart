import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/cubits/payment_cubit/payment_cubit.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool makeDefault = false;

  final cardNumberController = TextEditingController();

  final cardExpiryDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var autovalidateMode = AutovalidateMode.disabled;
  List<String> children = [Brands.mastercard, Brands.visa];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(title: S.of(context).addNewCard),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Wrap(
              children: List.generate(
                children.length,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
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
            ),
            const SizedBox(height: 16),
            Form(
              autovalidateMode: autovalidateMode,
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: S.of(context).cardHolderName,
                      validator:
                          (p0) =>
                              Validation.cardNameValidator(context, p0 ?? ''),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: S.of(context).cardNumber,
                      onChanged: (value) {
                        context.read<PaymentCubit>().setCardNumber(
                          int.parse(value),
                        );
                        if (value.length > 16) {
                          cardNumberController.text = value.substring(0, 16);
                          cardNumberController
                              .selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: cardNumberController.text.length,
                            ),
                          );
                        }
                      },
                      validator:
                          (p0) =>
                              Validation.cardNumberValidator(context, p0 ?? ''),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                      controller: cardNumberController,
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
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
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
                                cardExpiryDateController
                                    .text = cardExpiryDateController.text
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
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator:
                                (p0) =>
                                    Validation.cvvValidator(context, p0 ?? ''),
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
                          context.read<PaymentCubit>().addCard();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
