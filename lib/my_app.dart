import 'package:e_commerce_app/core/cubits/payment_cubit/payment_cubit.dart';
import 'package:e_commerce_app/core/helpers/card_repository.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/core/themes/dark_theme.dart';
import 'package:e_commerce_app/core/themes/light_theme.dart';
import 'package:e_commerce_app/core/widgets/loading_screen.dart';
import 'package:e_commerce_app/core/widgets/main_layout.dart';
import 'package:e_commerce_app/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Store store = objectbox.store;

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => PaymentCubit(CardRepository(store))..getAllCards(),
          ),
        ],
        child: StreamBuilder<Map<String, String?>>(
          stream: Storage.getUserData().asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, String?> data = snapshot.data!;
              String? token = data['token'];
              return token != null
                  ? const MainLayout()
                  : const OnboardingScreen();
            } else if (snapshot.hasError) {
              return const Material(
                child: Center(child: Text('SomeThing went Wrong')),
              );
            } else {
              return const LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}
