import 'package:cosmetics_store/screens/onboarding-screen/widgets/flower.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class OnboardingAnimationScreen extends StatefulWidget {
  static const String routeName = '/onboarding_animation_screen';
  const OnboardingAnimationScreen({super.key});

  @override
  State<OnboardingAnimationScreen> createState() =>
      _OnboardingAnimationScreenState();
}

class _OnboardingAnimationScreenState extends State<OnboardingAnimationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colours.primaryColor.withValues(alpha: 0.5),
              Colours.transparentColor,
            ],
            stops: [0, 1],
            radius: 1.2,
            focalRadius: 0.2,
            center: Alignment(1.2, 0.6),
          ),
        ),
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colours.primaryColor.withValues(alpha: 0.5),
                Colours.transparentColor,
              ],
              stops: [0, 1],
              radius: 1.2,
              focalRadius: 0.2,
              center: Alignment(-1.2, -0.6),
            ),
          ),
          child: Center(child: Flower()),
        ),
      ),
    );
  }
}
