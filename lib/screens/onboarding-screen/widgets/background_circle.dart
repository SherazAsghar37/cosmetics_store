import 'dart:math';

import 'package:cosmetics_store/screens/onboarding-screen/widgets/circle_painter.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/star_one.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/star_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BackgroundCircle extends StatefulWidget {
  const BackgroundCircle({super.key});

  @override
  State<BackgroundCircle> createState() => _BackgroundCircleState();
}

class _BackgroundCircleState extends State<BackgroundCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 2 * pi, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final circleRadius = size.width * 1.2 / 2;
    final center = Offset(
      ((size.width * 1.2) / 2) - (size.width * 1.2 - size.width) / 1.35,
      (size.height / 2) - 87,
    );

    return Stack(
      children: [
        Positioned(
          right: -(size.width * 1.2 - size.width) / 2,
          top: -70,
          child: CustomPaint(
                size: Size(size.width * 1.2, size.height),
                painter: CirclePainter(),
              )
              .animate(delay: 800.ms)
              .fade(duration: 700.ms, curve: Curves.fastOutSlowIn)
              .scale(
                begin: Offset(0.8, 0.8),
                end: Offset(1, 1),
                duration: 700.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                _buildOrbitingStar(
                      center,
                      circleRadius,
                      _animation.value,
                      StarOne(),
                      0,
                    )
                    .animate(delay: 1400.ms)
                    .scale(
                      begin: Offset(0, 0),
                      end: Offset(1, 1),
                      duration: 500.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                _buildOrbitingStar(
                      center,
                      circleRadius,
                      _animation.value + pi * 1.5,
                      StarTwo(),
                      1,
                    )
                    .animate(delay: 1450.ms)
                    .scale(
                      begin: Offset(0, 0),
                      end: Offset(1, 1),
                      duration: 500.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                _buildOrbitingStar(
                      center,
                      circleRadius,
                      _animation.value + 2 * pi / 2.7,
                      StarOne(),
                      2,
                    )
                    .animate(delay: 1500.ms)
                    .scale(
                      begin: Offset(0, 0),
                      end: Offset(1, 1),
                      duration: 500.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                _buildOrbitingStar(
                      center,
                      circleRadius,
                      _animation.value + pi,
                      StarTwo(),
                      3,
                    )
                    .animate(delay: 1550.ms)
                    .scale(
                      begin: Offset(0, 0),
                      end: Offset(1, 1),
                      duration: 500.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildOrbitingStar(
    Offset center,
    double radius,
    double angle,
    CustomPainter painter,
    int index,
  ) {
    double x = center.dx + radius * cos(angle);
    double y = center.dy + radius * sin(angle);

    return Positioned(
      left: x,
      top: y,
      child: CustomPaint(
        size: Size(index.isEven ? 30 : 35, 35),
        painter: painter,
      ),
    );
  }
}
