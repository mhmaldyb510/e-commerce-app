import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Form(
          key: cubit.changePasswordFormKey,
          autovalidateMode: cubit.changePasswordAutovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(
                  S.of(context).createNewPasswordForSignIn,
                  style: TextStyles.bodyBaseBold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayscale950,
                  ),
                ),
                SizedBox(height: 34),
                // --------------password field----------------
                CustomTextFormField(
                  onChanged: (value) => cubit.changePasswordNewPassword = value,
                  validator:
                      (p0) => Validation.passwordValidator(context, p0 ?? ''),
                  hintText: S.of(context).password,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 24),
                // --------------confirm password field----------------
                CustomTextFormField(
                  onChanged:
                      (value) =>
                          cubit.changePasswordConfirmationPassword = value,
                  validator:
                      (p0) => Validation.confirmPasswordValidator(
                        context,
                        p0 ?? '',
                        cubit.changePasswordNewPassword,
                      ),
                  hintText: S.of(context).confirmPassword,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: "${S.of(context).create} ${S.of(context).newPassword}",
                  onPressed: () {
                    cubit.changePassword();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
