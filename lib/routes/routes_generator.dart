import 'package:cosmetics_store/routes/fade_transition.dart';
import 'package:cosmetics_store/screens/home-screen/home_screen.dart';
import 'package:cosmetics_store/screens/onboarding-screen/onboarding_animation_screen.dart';
import 'package:cosmetics_store/screens/onboarding-screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> routesGenerator(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingAnimationScreen.routeName:
      return FadeInTransition(widget: OnboardingAnimationScreen());
    case OnboardingScreen.routeName:
      return FadeInTransition(widget: const OnboardingScreen());
    case HomeScreen.routeName:
      return FadeInTransition(widget: HomeScreen());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text("Screen not found"))),
      );
  }
}
