import 'package:cosmetics_store/screens/onboarding-screen/widgets/background_circle.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/onboarding_content.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/onboarding_navigator.dart';
import 'package:flutter/material.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/background.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/child_flower.dart';
import 'package:cosmetics_store/utils/colours.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding_screen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Background(),
            BackgroundCircle(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 20,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChildFlower(),
                        SizedBox(height: size.height * 0.19),
                        OnboardingContent(),
                      ],
                    ),
                    OnboardingNavigator(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
