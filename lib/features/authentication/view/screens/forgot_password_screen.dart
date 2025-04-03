import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/features/authentication/view/widgets/authentication_app_bar.dart';
import 'package:e_commerce_app/features/authentication/view/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AuthenticationAppBar(
            title: AuthenticationAppBarType.forgotPassword,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ForgotPasswordForm(),
        ),
      ),
    );
  }
}
