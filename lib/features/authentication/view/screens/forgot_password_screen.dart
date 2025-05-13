import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/authentication/view/widgets/forgot_password_form.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthenticationLoading,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: CustomAppBar(
                title:
                    S
                        .of(context)
                        .forgotPassword
                        .split(S.of(context).questionMark)[0],
              ),
            ),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ForgotPasswordForm(),
            ),
          ),
        );
      },
    );
  }
}
