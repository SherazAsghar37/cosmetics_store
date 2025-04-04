import 'package:cosmetics_store/widgets/app_text.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingContent extends StatelessWidget {
  final AnimationController controller1;
  final AnimationController controller2;
  const OnboardingContent({
    super.key,
    required this.controller1,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                ],
              )
              .animate(controller: controller1, autoPlay: false)
              .moveX(
                begin: 0,
                end: -size.width * 0.9,
                duration: 1200.ms,
                curve: Curves.fastOutSlowIn,
              ),

          SizedBox(height: 15),
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
              )
              .animate(controller: controller2, autoPlay: false, delay: 3000.ms)
              .moveX(
                begin: 0,
                end: -size.width,
                duration: 1200.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ],
      ),
    );
  }
}
