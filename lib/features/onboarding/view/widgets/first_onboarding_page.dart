import 'package:e_commerce_app/core/constants/app_constants.dart';
import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstOnboardingPage extends StatelessWidget {
  const FirstOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.imagesOnboarding1, width: 250),
          SizedBox(height: 64),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 23,
                height: 1.0,
                color: Color(0xff0C0D0D),
                letterSpacing: 0,
              ),
              text: S.of(context).sayWelcome,
              children: <TextSpan>[
                TextSpan(
                  text: AppConstants.appName.split(' ')[0],
                  style: TextStyle(color: Color(0xff1B5E37)),
                  children: [
                    TextSpan(
                      text: AppConstants.appName.split(' ')[1],
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Text(
              S.of(context).onboardingDetails1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                height: 1.7,
                letterSpacing: 0,
                color: Color(0xff4E5556),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
