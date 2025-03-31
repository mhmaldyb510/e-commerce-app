import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  logIn() {
    autovalidateMode = AutovalidateMode.always;
    emit(AuthenticationInitial());
    if (formKey.currentState!.validate()) {
      // TODO: implement logIn
    }
  }
}
