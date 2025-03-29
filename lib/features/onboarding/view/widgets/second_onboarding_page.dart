import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondOnboardingPage extends StatelessWidget {
  const SecondOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.imagesOnboarding2, width: 250),
          SizedBox(height: 64),
          Text(
            S.of(context).onboardingHead2,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w700,
              fontSize: 23,
              height: 1.0,
              color: Color(0xff0C0D0D),
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Text(
              S.of(context).onboardingDetails2,
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
