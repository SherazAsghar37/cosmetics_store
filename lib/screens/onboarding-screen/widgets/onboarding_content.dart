import 'package:cosmetics_store/widgets/app_text.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                "We Know all",
                style: TextStyle(
                  fontFamily: 'Leotaro',
                  fontSize: 40,
                  color: Colours.primaryTextColor,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              )
              .animate(delay: 900.ms)
              .fade(duration: 700.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
          Text(
                "about beauty",
                style: TextStyle(
                  fontFamily: 'Leotaro',
                  fontSize: 40,
                  color: Colours.primaryTextColor,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              )
              .animate(delay: 950.ms)
              .fade(duration: 700.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
          SizedBox(height: 15),
          AppText(
                text: "Our experts select only the best",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
              .animate(delay: 1000.ms)
              .fade(duration: 700.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
          AppText(
                text: "premium brand care products that will",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.7,
              )
              .animate(delay: 1050.ms)
              .fade(duration: 700.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
          AppText(
                text: "suit your skin type and needs.",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
              .animate(delay: 1100.ms)
              .fade(duration: 700.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ],
      ),
    );
  }
}
