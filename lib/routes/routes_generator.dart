import 'package:cosmetics_store/model/product_model.dart';
import 'package:cosmetics_store/routes/fade_transition.dart';
import 'package:cosmetics_store/routes/slide_page_route.dart';
import 'package:cosmetics_store/screens/home-screen/home_screen.dart';
import 'package:cosmetics_store/screens/onboarding-screen/onboarding_animation_screen.dart';
import 'package:cosmetics_store/screens/onboarding-screen/onboarding_screen.dart';
import 'package:cosmetics_store/screens/product-details/product_details_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> routesGenerator(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingAnimationScreen.routeName:
      return FadeInTransition(widget: OnboardingAnimationScreen());
    case OnboardingScreen.routeName:
      return FadeInTransition(widget: const OnboardingScreen());
    case HomeScreen.routeName:
      return SlidePageRoute(widget: HomeScreen());
    case ProductDetailsScreen.routeName:
      return FadeInTransition(
        duration: 1000,
        widget: ProductDetailsScreen(
          product: routeSettings.arguments as ProductModel,
        ),
      );

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text("Screen not found"))),
      );
  }
}
