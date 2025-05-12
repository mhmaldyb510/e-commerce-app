import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/account/cubit/change_personal_info_cubit.dart';
import 'package:e_commerce_app/features/account/model/helpers/check_for_password_changes.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePersonalInfoCubit, ChangePersonalInfoState>(
      builder: (context, state) {
        return Form(
          autovalidateMode:
              context.read<ChangePersonalInfoCubit>().passwordAutovalidateMode,
          key: context.read<ChangePersonalInfoCubit>().passwordFormKey,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).changePassword,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: S.of(context).theCurrentPassword,
                validator: (p0) {
                  if (!checkForPasswordChanges(
                    context.read<ChangePersonalInfoCubit>().currentPassword,
                    context.read<ChangePersonalInfoCubit>().newPassword,
                    context.read<ChangePersonalInfoCubit>().confirmPassword,
                  )) {
                    return null;
                  } else {
                    return Validation.passwordValidator(context, p0 ?? '');
                  }
                },
                isPassword: true,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                onChanged:
                    (value) =>
                        context
                            .read<ChangePersonalInfoCubit>()
                            .currentPassword = value,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: S.of(context).theNewPassword,
                validator: (p0) {
                  if (!checkForPasswordChanges(
                    context.read<ChangePersonalInfoCubit>().currentPassword,
                    context.read<ChangePersonalInfoCubit>().newPassword,
                    context.read<ChangePersonalInfoCubit>().confirmPassword,
                  )) {
                    return null;
                  } else {
                    return Validation.passwordValidator(context, p0 ?? '');
                  }
                },
                onChanged:
                    (value) =>
                        context.read<ChangePersonalInfoCubit>().newPassword =
                            value,
                isPassword: true,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: S.of(context).confirmTheNewPassword,
                validator: (p0) {
                  if (!checkForPasswordChanges(
                    context.read<ChangePersonalInfoCubit>().currentPassword,
                    context.read<ChangePersonalInfoCubit>().newPassword,
                    context.read<ChangePersonalInfoCubit>().confirmPassword,
                  )) {
                    return null;
                  } else {
                    return Validation.confirmPasswordValidator(
                      context,
                      p0 ?? '',
                      context.read<ChangePersonalInfoCubit>().newPassword,
                    );
                  }
                },
                isPassword: true,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                onChanged:
                    (value) =>
                        context
                            .read<ChangePersonalInfoCubit>()
                            .confirmPassword = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
