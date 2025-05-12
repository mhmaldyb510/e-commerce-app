import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/core/widgets/main_layout.dart';
import 'package:e_commerce_app/features/authentication/view/screens/code_verification_screen.dart';
import 'package:flutter/material.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  // logIn variables

  AutovalidateMode logInAutovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();

  String logInEmail = '';

  String logInPassword = '';

  logIn(BuildContext context) {
    logInAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (logInFormKey.currentState!.validate()) {
      // TODO: implement logIn
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainLayout()),
        (route) => false,
      );
    }
  }

  // signUp variables

  AutovalidateMode signUpAutovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  String signUpEmail = '';

  String signUpPassword = '';

  String signUpName = '';

  bool signUpAcceptLicense = false;

  void changeSignUpAcceptLicenseState() {
    signUpAcceptLicense = !signUpAcceptLicense;
    emit(AuthenticationInitial());
  }

  signUp(BuildContext context) {
    signUpAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (signUpFormKey.currentState!.validate()) {
      // TODO: implement signUp
      Storage.setUserData(name: signUpName, email: signUpEmail);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainLayout()),
        (route) => false,
      );
    }
  }

  // forgetPassword variables

  String forgetPasswordEmail = '';

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  AutovalidateMode forgetPasswordAutovalidateMode = AutovalidateMode.disabled;

  forgetPassword(BuildContext context) {
    forgetPasswordAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (forgetPasswordFormKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CodeVerificationScreen()),
      );
    }
  }

  // OTP variables

  //TODO: handel otp variables

  // changePassword variables

  String changePasswordNewPassword = '';

  String changePasswordConfirmationPassword = '';

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  AutovalidateMode changePasswordAutovalidateMode = AutovalidateMode.disabled;

  changePassword() {
    changePasswordAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (changePasswordFormKey.currentState!.validate()) {
      // TODO: implement changePassword
    }
  }
}
