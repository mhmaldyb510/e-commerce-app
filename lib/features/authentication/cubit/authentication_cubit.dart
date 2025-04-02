import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  // logIn variables

  AutovalidateMode logInAutovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();

  String logInEmail = '';

  String logInPassword = '';

  logIn() {
    logInAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (logInFormKey.currentState!.validate()) {
      // TODO: implement logIn
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

  signUp() {
    signUpAutovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (signUpFormKey.currentState!.validate()) {
      // TODO: implement signUp
    }
  }
}
