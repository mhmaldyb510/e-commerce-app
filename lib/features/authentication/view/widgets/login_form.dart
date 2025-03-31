import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/third_part_buttons.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                // --------------email field----------------
                CustomTextFormField(
                  onChanged: (value) => cubit.email = value,
                  validator:
                      (p0) => Validation.emailValidator(context, p0 ?? ''),
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                // --------------password field----------------
                CustomTextFormField(
                  onChanged: (value) => cubit.password = value,
                  validator:
                      (p0) => Validation.passwordValidator(context, p0 ?? ''),
                  hintText: S.of(context).password,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16),
                // --------------forgot password section----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        S.of(context).forgotPassword,
                        style: TextStyles.bodySmallBold.copyWith(
                          color: AppColors.green1_600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                // --------------login button----------------
                CustomButton(text: S.of(context).login, onPressed: cubit.logIn),
                SizedBox(height: 33),
                // --------------dont have an account section----------------
                GestureDetector(
                  child: RichText(
                    text: TextSpan(
                      text: '${S.of(context).dontHaveAnAccount} ',
                      style: TextStyles.bodyBaseBold.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grayscale400,
                      ),
                      children: [
                        TextSpan(
                          text: S.of(context).createAccount,
                          style: TextStyle(color: AppColors.green1_500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 33),
                // --------------or section----------------
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.offColor, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        S.of(context).or,
                        style: TextStyles.bodyBaseBold.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.grayscale950,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.offColor, thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // --------------google button----------------
                ThirdPartButtons(
                  text: S.of(context).signInWithGoogle,
                  icon: Brand(Brands.google),
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                // --------------apple button----------------
                ThirdPartButtons(
                  text: S.of(context).signInWithApple,
                  icon: Brand(
                    Brands.apple_logo,

                    colorFilter: ColorFilter.mode(
                      AppColors.grayscale950,
                      BlendMode.srcATop,
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                // --------------facebook button----------------
                ThirdPartButtons(
                  text: S.of(context).signInWithFacebook,
                  icon: Brand(Brands.facebook),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
