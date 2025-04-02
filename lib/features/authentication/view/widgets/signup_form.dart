import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/features/authentication/view/screens/login_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Form(
          autovalidateMode: cubit.signUpAutovalidateMode,
          key: cubit.signUpFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                // --------------name field----------------
                CustomTextFormField(
                  validator:
                      (p0) => Validation.nameValidator(context, p0 ?? ''),
                  hintText: S.of(context).fullName,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => cubit.signUpName = value,
                ),
                SizedBox(height: 16),
                // --------------email field----------------
                CustomTextFormField(
                  validator:
                      (p0) => Validation.emailValidator(context, p0 ?? ''),
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => cubit.signUpEmail = value,
                ),
                SizedBox(height: 16),
                // --------------password field----------------
                CustomTextFormField(
                  validator:
                      (p0) => Validation.passwordValidator(context, p0 ?? ''),
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => cubit.signUpPassword = value,
                  hintText: S.of(context).password,
                ),
                SizedBox(height: 16),
                // --------------accept license checkbox----------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(color: AppColors.offColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        activeColor: Theme.of(context).primaryColor,
                        value: cubit.signUpAcceptLicense,

                        onChanged:
                            (value) => cubit.changeSignUpAcceptLicenseState(),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: S.of(context).byCreatingAccount.split('|')[0],
                          style: TextStyles.bodySmallBold.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.grayscale400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  S.of(context).byCreatingAccount.split('|')[1],
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // --------------sign up button----------------
                CustomButton(
                  text: S.of(context).createNewAccount,
                  onPressed: () {
                    cubit.signUp();
                  },
                ),
                SizedBox(height: 26),
                // --------------already have an account section----------------
                GestureDetector(
                  onTap:
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                  child: RichText(
                    text: TextSpan(
                      text: ' ${S.of(context).alreadyHaveAnAccount} ',
                      style: TextStyles.bodyBaseBold.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grayscale400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: S.of(context).login,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
