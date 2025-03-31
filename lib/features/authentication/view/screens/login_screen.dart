import 'package:e_commerce_app/features/authentication/view/widgets/authentication_app_bar.dart';
import 'package:e_commerce_app/features/authentication/view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AuthenticationAppBar(title: AuthenticationAppBarType.login),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LoginForm(),
        ),
      ),
    );
  }
}
