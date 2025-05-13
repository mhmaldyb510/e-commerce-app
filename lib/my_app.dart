import 'package:e_commerce_app/core/cubits/payment_cubit/payment_cubit.dart';
import 'package:e_commerce_app/core/helpers/card_repository.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/core/themes/dark_theme.dart';
import 'package:e_commerce_app/core/themes/light_theme.dart';
import 'package:e_commerce_app/core/widgets/main_layout.dart';
import 'package:e_commerce_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Store store = objectbox.store;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    Storage.getUserData().asStream().listen((event) {
      setState(() {
        isLoggedIn = event['token'] != null;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  PaymentCubit(CardRepository(MyApp.store))..getAllCards(),
        ),
        if (!isLoggedIn)
          BlocProvider(create: (context) => AuthenticationCubit()),
      ],
      child: MaterialApp(
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
        home: isLoggedIn ? const MainLayout() : const OnboardingScreen(),
      ),
    );
  }
}
