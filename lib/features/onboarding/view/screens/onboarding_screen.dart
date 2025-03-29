import 'dart:developer';

import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                currentIndex == 0
                    ? AssetImage(Assets.imagesOnboardingBackground)
                    : AssetImage(Assets.imagesOnboardingBackground2),
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
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          S.of(context).skip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            height: 1.6,
                            letterSpacing: 0,
                            color: Colors.grey.shade400,
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
                  children: [FirstOnboardingPage(), SecondOnboardingPage()],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect:
                    currentIndex == 1
                        ? ExpandingDotsEffect(dotColor: Colors.indigo)
                        : WormEffect(),
              ),
              SizedBox(height: 29),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child:
                      currentIndex == 1
                          ? CustomButton(
                            key: ValueKey('startNowButton'),
                            onPressed: () {},
                            child: Text(
                              S.of(context).startNow,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                height: 1.6,
                                letterSpacing: 0,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          )
                          : SizedBox(height: 54, key: ValueKey('emptySpace')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
