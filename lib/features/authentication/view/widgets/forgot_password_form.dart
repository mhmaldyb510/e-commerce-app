import 'package:e_commerce_app/core/constants/validation.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Form(
          key: cubit.forgetPasswordFormKey,
          autovalidateMode: cubit.forgetPasswordAutovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(
                  S.of(context).verificationCodePrompt,
                  style: TextStyles.bodyBaseBold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayscale600,
                  ),
                ),
                SizedBox(height: 31),
                // --------------email field----------------
                CustomTextFormField(
                  validator:
                      (p0) => Validation.emailValidator(context, p0 ?? ''),
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => cubit.forgetPasswordEmail = value,
                ),
                SizedBox(height: 30),
                // --------------action button----------------
                CustomButton(
                  text:
                      S
                          .of(context)
                          .forgotPassword
                          .split(S.of(context).questionMark)[0],
                  onPressed: () {
                    cubit.forgetPassword(context);
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
