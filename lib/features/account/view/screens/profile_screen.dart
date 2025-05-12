import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/account/cubit/change_personal_info_cubit.dart';
import 'package:e_commerce_app/features/account/view/widgets/change_password_form.dart';
import 'package:e_commerce_app/features/account/view/widgets/change_personal_info_form.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(title: S.of(context).profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (context) => ChangePersonalInfoCubit()..getPersonalInfo(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                const ChangePersonalInfoForm(),
                const SizedBox(height: 16),
                const ChangePasswordForm(),
                const SizedBox(height: 74),
                Builder(
                  builder: (context) {
                    return CustomButton(
                      text: S.of(context).saveTheChanges,
                      onPressed: () {
                        context
                            .read<ChangePersonalInfoCubit>()
                            .changeUserInfo();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
