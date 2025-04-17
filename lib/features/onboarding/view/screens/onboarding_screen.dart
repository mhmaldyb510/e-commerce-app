import 'dart:developer';

import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/authentication/view/screens/login_screen.dart';
import 'package:e_commerce_app/features/onboarding/view/widgets/first_onboarding_page.dart';
import 'package:e_commerce_app/features/onboarding/view/widgets/second_onboarding_page.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                currentIndex == 0
                    ? ColorFilter.mode(
                      Colors.white.withAlpha(170),
                      BlendMode.overlay,
                    )
                    : null,
            image:
                currentIndex == 0
                    ? const AssetImage(Assets.imagesOnboardingBackground)
                    : const AssetImage(Assets.imagesOnboardingBackground2),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              currentIndex == 0
                  ? Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          S.of(context).skip,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            height: 1.6,
                            letterSpacing: 0,
                            color: Color(0xff949D9E),
                          ),
                        ),
                      ),
                    ],
                  )
                  : const SizedBox.shrink(),
              Expanded(
                flex: 6,
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    log("Page changed to: $value");
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  children: const [
                    FirstOnboardingPage(),
                    SecondOnboardingPage(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect:
                    currentIndex == 1
                        ? const ExpandingDotsEffect(dotColor: Colors.indigo)
                        : const WormEffect(),
              ),
              const SizedBox(height: 29),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child:
                      currentIndex == 1
                          ? CustomButton(
                            key: const ValueKey('startNowButton'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            text: S.of(context).startNow,
                          )
                          : const SizedBox(
                            height: 54,
                            key: ValueKey('emptySpace'),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
