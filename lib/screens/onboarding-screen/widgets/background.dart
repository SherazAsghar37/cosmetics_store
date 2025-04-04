import 'dart:ui';

import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Background extends StatelessWidget {
  final AnimationController controller;
  const Background({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          left: -80,
          child: _buildBlurredContainer(
            300,
            300,
            Colours.primaryColor,
            Alignment.centerLeft,
            Alignment.centerRight,
            controller,
          ),
        ),
        Positioned(
          bottom: 100,
          right: -130,
          child: _buildBlurredContainer(
            300,
            300,
            Colours.primaryColor,
            Alignment.centerLeft,
            Alignment.centerRight,
            controller,
          ),
        ),
        Positioned(
          left: -50,
          top: 250,
          child: _buildBlurredContainer(
            150,
            120,
            Colours.secondaryColor,
            Alignment.topRight,
            Alignment.bottomLeft,
            controller,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 100,
          child: _buildBlurredContainer(
            150,
            120,
            Colours.secondaryColor,
            Alignment.topRight,
            Alignment.bottomLeft,
            controller,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 00,
          child: _buildBlurredContainer(
            0,
            0,
            Colours.secondaryColor.withValues(alpha: 0.4),
            Alignment.topRight,
            Alignment.bottomLeft,
            controller,
          ),
        ),
      ],
    );
  }

  Widget _buildBlurredContainer(
    double width,
    double height,
    Color color,
    Alignment begin,
    Alignment end,
    AnimationController controller,
  ) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
      child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.3)],
              ),
              borderRadius: BorderRadius.circular(height / 2),
            ),
          )
          .animate(controller: controller, autoPlay: false)
          .fade(
            begin: 1,
            end: 0,
            duration: 1200.ms,
            curve: Curves.fastOutSlowIn,
          ),
    );
  }
}
