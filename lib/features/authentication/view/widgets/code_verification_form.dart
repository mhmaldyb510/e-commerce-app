import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/light_theme.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/features/authentication/view/screens/new_password_screen.dart';
import 'package:e_commerce_app/features/authentication/view/widgets/otp_field.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeVerificationForm extends StatelessWidget {
  const CodeVerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Text(
                  '${S.of(context).enterCodeSentToEmail}\nExample@email.com',
                  style: TextStyles.bodyBaseBold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayscale600,
                  ),
                ),
                const SizedBox(height: 29),
                // --------------code field----------------
                const OtpField(length: 4),
                const SizedBox(height: 29),
                CustomButton(
                  text: S.of(context).codeVerification,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NewPasswordScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Text(
                      S.of(context).resendCode,
                      style: TextStyles.bodyBaseBold.copyWith(
                        color: LightTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
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
