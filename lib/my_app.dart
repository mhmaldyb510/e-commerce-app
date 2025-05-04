import 'package:e_commerce_app/core/themes/dark_theme.dart';
import 'package:e_commerce_app/core/themes/light_theme.dart';
import 'package:e_commerce_app/core/widgets/main_layout.dart';
// import 'package:e_commerce_app/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: LightTheme().getThemeData(),
      darkTheme: DarkTheme().getThemeData(),
      // home: const OnboardingScreen(),
      home: const MainLayout(),
    );
  }
}
