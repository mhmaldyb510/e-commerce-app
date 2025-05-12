import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/account/cubit/change_personal_info_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePersonalInfoForm extends StatelessWidget {
  const ChangePersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePersonalInfoCubit, ChangePersonalInfoState>(
      builder: (context, state) {
        return Form(
          key: context.read<ChangePersonalInfoCubit>().personalInfoFormKey,
          autovalidateMode:
              context
                  .read<ChangePersonalInfoCubit>()
                  .personalInfoAutovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).personalInformation,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller:
                    context
                        .read<ChangePersonalInfoCubit>()
                        .currentNameController,
                hintText:
                    context
                        .read<ChangePersonalInfoCubit>()
                        .currentNameController
                        .text,
                keyboardType: TextInputType.text,
                validator:
                    context.read<ChangePersonalInfoCubit>().newName.isEmpty ||
                            context.read<ChangePersonalInfoCubit>().newName ==
                                ''
                        ? null
                        : (p0) => Validation.nameValidator(context, p0 ?? ''),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  context.read<ChangePersonalInfoCubit>().newName = value;
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller:
                    context
                        .read<ChangePersonalInfoCubit>()
                        .currentEmailController,
                hintText:
                    context
                        .read<ChangePersonalInfoCubit>()
                        .currentEmailController
                        .text,
                keyboardType: TextInputType.emailAddress,
                validator:
                    context.read<ChangePersonalInfoCubit>().newEmail.isEmpty ||
                            context.read<ChangePersonalInfoCubit>().newEmail ==
                                ''
                        ? null
                        : (p0) => Validation.emailValidator(context, p0 ?? ''),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  context.read<ChangePersonalInfoCubit>().newEmail = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
