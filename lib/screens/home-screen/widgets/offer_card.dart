import 'package:cosmetics_store/utils/colours.dart';
import 'package:cosmetics_store/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colours.secondaryColor, Colours.primaryColor],
          transform: GradientRotation(0.5),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
                text: "20%",
                fontSize: 45,
                fontWeight: FontWeight.w500,
                height: 1,
              )
              .animate(delay: 700.ms)
              .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 50,
                end: 0,
                duration: 1000.ms,
                curve: Curves.fastOutSlowIn,
              ),
          AppText(
                text: "for a friend",
                fontSize: 28,
                fontWeight: FontWeight.w300,
                height: 1,
              )
              .animate(delay: 750.ms)
              .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 50,
                end: 0,
                duration: 1000.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ],
      ),
    );
  }
}
