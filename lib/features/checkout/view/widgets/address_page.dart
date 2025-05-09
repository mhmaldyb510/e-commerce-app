import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool saveAddress = true;

  @override
  Widget build(BuildContext context) {
    final focusScope = FocusScope.of(context);

    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hintText: S.of(context).fullName,
            validator: (p0) => Validation.nameValidator(context, p0 ?? ''),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => focusScope.nextFocus(),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: S.of(context).email,
            validator: (p0) => Validation.emailValidator(context, p0 ?? ''),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: S.of(context).address,
            validator: (p0) => Validation.addressValidator(context, p0 ?? ''),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: S.of(context).city,
            validator: (p0) => Validation.nameValidator(context, p0 ?? ''),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => focusScope.nextFocus(),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: S.of(context).floorAndApartmentNumber,
            validator: (p0) => Validation.apartmentValidator(context, p0 ?? ''),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Transform.scale(
                scale: 0.6, // Adjust the scale factor as needed
                child: Switch(
                  value: saveAddress,
                  onChanged: (p0) {
                    setState(() {
                      saveAddress = p0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).saveTheAddress,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
          CustomButton(
            text: S.of(context).next,
            onPressed: () {
              setState(() {
                _autoValidateMode = AutovalidateMode.always;
              });
              if (_formKey.currentState!.validate()) {
                context.read<CheckoutCubit>().done.add(S.of(context).address);
                context.read<CheckoutCubit>().changePageIndex(
                  context.read<CheckoutCubit>().pageIndex + 1,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
