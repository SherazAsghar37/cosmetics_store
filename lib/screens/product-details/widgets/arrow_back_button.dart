import 'package:cosmetics_store/utils/colours.dart';
import 'package:cosmetics_store/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colours.cardBackgroundColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colours.whiteColor,
              size: 20,
            ),
          ),
        )
        .animate(delay: 200.ms)
        .moveY(begin: 30, end: 0, duration: 800.ms, curve: Curves.fastOutSlowIn)
        .fade(duration: 800.ms, curve: Curves.fastOutSlowIn);
  }
}
