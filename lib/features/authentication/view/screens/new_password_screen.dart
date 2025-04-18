import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/authentication/view/widgets/new_password_form.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: CustomAppBar(title: S.of(context).newPassword),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NewPasswordForm(),
        ),
      ),
    );
  }
}
