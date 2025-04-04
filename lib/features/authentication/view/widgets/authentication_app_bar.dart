import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthenticationAppBar extends StatelessWidget {
  final AuthenticationAppBarType title;
  const AuthenticationAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          Navigator.canPop(context)
              ? IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  iconSize: 22,
                  fixedSize: Size(44, 44),
                  side: BorderSide(color: Color(0xffF1F1F5)),
                ),
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.arrow_back_ios),
              )
              : null,
      centerTitle: true,
      title: Text(
        title == AuthenticationAppBarType.login
            ? S.of(context).login
            : title == AuthenticationAppBarType.register
            ? S.of(context).newAccount
            : S.of(context).forgotPassword.split(S.of(context).questionMark)[0],
        style: TextStyles.bodyLargeBold,
      ),
    );
  }
}

enum AuthenticationAppBarType { login, register, forgotPassword }
