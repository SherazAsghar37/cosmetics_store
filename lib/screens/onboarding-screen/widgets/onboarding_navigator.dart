import 'dart:math' as math;

import 'package:cosmetics_store/screens/onboarding-screen/widgets/oval_painter.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/wavy_circle_painter.dart';
import 'package:cosmetics_store/utils/assets.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:cosmetics_store/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingNavigator extends StatefulWidget {
  const OnboardingNavigator({super.key});

  @override
  State<OnboardingNavigator> createState() => _OnboardingNavigatorState();
}

class _OnboardingNavigatorState extends State<OnboardingNavigator> {
  int currentIndex = 2;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child:
                      index == currentIndex
                          ? SizedBox(
                                key: ValueKey(index),
                                width: 25,
                                height: 12,
                                child: CustomPaint(
                                  painter: OvalPainter(Colours.whiteColor),
                                ),
                              )
                              .animate(delay: 1550.ms + (index * 50).ms)
                              .scale(
                                begin: Offset(0, 0),
                                end: Offset(1, 1),
                                duration: 500.ms,
                                curve: Curves.fastOutSlowIn,
                              )
                          : Container(
                                key: ValueKey(index),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colours.transparentColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colours.whiteColor,
                                  ),
                                ),
                              )
                              .animate(delay: 1550.ms + (index * 50).ms)
                              .scale(
                                begin: Offset(0, 0),
                                end: Offset(1, 1),
                                duration: 500.ms,
                                curve: Curves.fastOutSlowIn,
                              ),
                ),
              ),
            ),
          ),
          BouncingButton(
                onPressed: () {},
                child: Transform.rotate(
                  angle: -10 * (math.pi / 180),
                  child: CustomPaint(
                    painter: WavyCirclePainter(),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: Transform.rotate(
                          angle: -30 * (math.pi / 180),
                          child: SvgPicture.asset(
                                Assets.arrowForwardIcon,
                                width: 0,
                                height: 30,
                                colorFilter: ColorFilter.mode(
                                  Colours.whiteColor,
                                  BlendMode.srcIn,
                                ),
                              )
                              .animate(delay: 2000.ms)
                              .move(
                                begin: Offset(-30, -30),
                                end: Offset(0, 0),
                                duration: 500.ms,
                                curve: Curves.fastOutSlowIn,
                              )
                              .fade(
                                duration: 500.ms,
                                curve: Curves.fastOutSlowIn,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .animate(delay: 1500.ms)
              .scale(
                begin: Offset(0, 0),
                end: Offset(1, 1),
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ],
      ),
    );
  }
}
