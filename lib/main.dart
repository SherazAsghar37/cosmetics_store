import 'package:cosmetics_store/routes/routes_generator.dart';
import 'package:cosmetics_store/screens/onboarding-screen/onboarding_animation_screen.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Costmetics Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colours.blackColor),
      ),
      onGenerateRoute: routesGenerator,
      home: OnboardingAnimationScreen(),
    );
  }
}
