import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/features/account/view/model/helpers/check_for_password_changes.dart';
import 'package:flutter/material.dart';

part 'change_personal_info_state.dart';

class ChangePersonalInfoCubit extends Cubit<ChangePersonalInfoState> {
  ChangePersonalInfoCubit() : super(ChangePersonalInfoInitial());

  final TextEditingController currentNameController = TextEditingController();
  final TextEditingController currentEmailController = TextEditingController();
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  String newName = '';
  String newEmail = '';

  getPersonalInfo() async {
    await Storage.getUserData().then((value) {
      currentNameController.text = value['name'] ?? '';
      currentEmailController.text = value['email'] ?? '';
    });
    emit(GetUserInfoState());
  }

  final passwordFormKey = GlobalKey<FormState>();
  AutovalidateMode passwordAutovalidateMode = AutovalidateMode.disabled;

  final personalInfoFormKey = GlobalKey<FormState>();
  AutovalidateMode personalInfoAutovalidateMode = AutovalidateMode.disabled;

  changeUserInfo() {
    // Reset validation state if all password fields are empty
    if (currentPassword.isEmpty &&
        newPassword.isEmpty &&
        confirmPassword.isEmpty) {
      passwordAutovalidateMode = AutovalidateMode.disabled;
      emit(ValidationChangedState());
      return;
    }

    // Enable validation if any password field is modified
    if (checkForPasswordChanges(
      currentPassword,
      newPassword,
      confirmPassword,
    )) {
      passwordAutovalidateMode = AutovalidateMode.always;
    } else {
      passwordAutovalidateMode = AutovalidateMode.disabled;
    }

    personalInfoAutovalidateMode = AutovalidateMode.always;
    emit(ValidationChangedState());

    if (checkForPasswordChanges(
      currentPassword,
      newPassword,
      confirmPassword,
    )) {
      if (passwordFormKey.currentState!.validate() &&
          personalInfoFormKey.currentState!.validate()) {
        if (newEmail == '' || newEmail.isEmpty) {
          newEmail = currentEmailController.text;
        }
        if (newName == '' || newName.isEmpty) {
          newName = currentNameController.text;
        }
        Storage.setUserData(name: newName, email: newEmail);
        emit(ChangeUserInfoSuccessState());
      }
    } else {
      if (personalInfoFormKey.currentState!.validate()) {
        if (newEmail == '' || newEmail.isEmpty) {
          newEmail = currentEmailController.text;
        }
        if (newName == '' || newName.isEmpty) {
          newName = currentNameController.text;
        }
        Storage.setUserData(name: newName, email: newEmail);
        emit(ChangeUserInfoSuccessState());
      }
    }
  }
}
