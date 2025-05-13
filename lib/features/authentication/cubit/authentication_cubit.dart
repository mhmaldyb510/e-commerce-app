import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/main_layout.dart';
import 'package:e_commerce_app/features/authentication/model/auth_api_helper.dart';
import 'package:e_commerce_app/features/authentication/view/screens/code_verification_screen.dart';
import 'package:e_commerce_app/features/authentication/view/screens/new_password_screen.dart';
import 'package:e_commerce_app/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  // logIn variables

  AutovalidateMode logInAutovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();

  String logInEmail = '';

  String logInPassword = '';

  logIn(BuildContext context) async {
    logInAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (logInFormKey.currentState!.validate()) {
      try {
        await AuthApiHelper.login(email: logInEmail, password: logInPassword);
        if (context.mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainLayout()),
            (route) => false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }

  // signUp variables

  AutovalidateMode signUpAutovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  String signUpEmail = '';

  String signUpPassword = '';

  String signUpName = '';

  String signUpPhone = '';

  bool signUpAcceptLicense = false;

  void changeSignUpAcceptLicenseState() {
    signUpAcceptLicense = !signUpAcceptLicense;
    emit(AuthenticationInitial());
  }

  signUp(BuildContext context) async {
    signUpAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (!signUpAcceptLicense) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).pleaseAcceptTheTermsOfUse)),
        );
      }
      return;
    }
    if (signUpFormKey.currentState!.validate()) {
      try {
        await AuthApiHelper.register(
          name: signUpName,
          email: signUpEmail,
          password: signUpPassword,
          rePassword: signUpPassword,
          phone: signUpPhone,
        );
        if (context.mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainLayout()),
            (route) => false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(
                    S.of(context).error,
                    style: TextStyles.bodySmallBold.copyWith(
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(S.of(context).ok),
                    ),
                  ],
                ),
          );
        }
      }
    }
  }

  // forgetPassword variables

  String forgetPasswordEmail = '';

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  AutovalidateMode forgetPasswordAutovalidateMode = AutovalidateMode.disabled;

  forgetPassword(BuildContext context) async {
    forgetPasswordAutovalidateMode = AutovalidateMode.always;
    if (forgetPasswordFormKey.currentState!.validate()) {
      emit(AuthenticationLoading());
      try {
        await AuthApiHelper.forgetPassword(email: forgetPasswordEmail);
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CodeVerificationScreen(),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
    emit(AuthenticationInitial());
  }

  // codeVerification variables

  String verificationCode = '';

  GlobalKey<FormState> verificationCodeFormKey = GlobalKey<FormState>();

  AutovalidateMode verificationCodeAutovalidateMode = AutovalidateMode.disabled;

  verificationCodeVerification(BuildContext context) async {
    verificationCodeAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationLoading());
    if (verificationCodeFormKey.currentState!.validate()) {
      try {
        await AuthApiHelper.verifyCode(code: verificationCode);
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewPasswordScreen()),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
    emit(AuthenticationInitial());
  }

  resendCode(BuildContext context) async {
    emit(AuthenticationLoading());
    try {
      await AuthApiHelper.forgetPassword(email: forgetPasswordEmail);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
    emit(AuthenticationInitial());
  }
  // changePassword variables

  String changePasswordNewPassword = '';

  String changePasswordConfirmationPassword = '';

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  AutovalidateMode changePasswordAutovalidateMode = AutovalidateMode.disabled;

  changePassword(BuildContext context) async {
    changePasswordAutovalidateMode = AutovalidateMode.always;
    if (changePasswordFormKey.currentState!.validate()) {
      emit(AuthenticationLoading());
      try {
        await AuthApiHelper.resetPassword(
          email: forgetPasswordEmail,
          newPassword: changePasswordNewPassword,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).passwordChangedSuccessfully)),
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            (route) => false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
    emit(AuthenticationInitial());
  }
}
