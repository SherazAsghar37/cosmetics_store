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
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    _controller1 = AnimationController(vsync: this);
    _controller2 = AnimationController(vsync: this);
    super.initState();
  }

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
            Background(controller: _controller1),

            BackgroundCircle(controller: _controller2),
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
                        ChildFlower(controller: _controller2),
                        SizedBox(height: size.height * 0.19),
                        OnboardingContent(
                          controller1: _controller1,
                          controller2: _controller2,
                        ),
                      ],
                    ),
                    OnboardingNavigator(
                      controller: _controller2,
                      onLastPage: () async {
                        _controller1.forward();
                        await Future.delayed(
                          const Duration(milliseconds: 150),
                          () {
                            _controller2.forward();
                          },
                        );
                      },
                    ),
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
