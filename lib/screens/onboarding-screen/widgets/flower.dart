import 'dart:math';

import 'package:cosmetics_store/screens/onboarding-screen/onboarding_screen.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/perl_painter.dart';
import 'package:cosmetics_store/utils/curved_rect_tween.dart';
import 'package:flutter/material.dart';

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  State<Flower> createState() => _FlowerState();
}

class _FlowerState extends State<Flower> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> scaleAnimations;
  late List<Animation<Offset>> moveAnimations;
  bool dataFetched = false;
  int count = 12;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550 * 12),
    )..forward();

    scaleAnimations = List.generate(count, (index) {
      final inc = ((index + 1) / count);
      return Tween<Offset>(begin: Offset(0.1, 0), end: Offset(1, 1)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            ((index * 0.7) / count),
            inc,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
    });
    moveAnimations = List.generate(count, (index) {
      final inc = ((index + 1) / count);
      return Tween<Offset>(begin: Offset(5, -2), end: Offset(5, -2)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            ((index * 0.6) / count),
            inc,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
    });

    //Data fetching
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000), () {
        accelerateAnimation();
      });
    });

    _controller.addListener(() async {
      if (_controller.isCompleted) {
        Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
      }
    });
  }

  void accelerateAnimation() {
    if (dataFetched) return;
    dataFetched = true;

    double accelerationFactor = 0.3;

    final newDuration = Duration(
      milliseconds:
          (_controller.duration!.inMilliseconds * accelerationFactor).toInt(),
    );

    _controller.duration = newDuration;
    _controller.forward(from: _controller.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    double radius = 35;
    return Hero(
      tag: 'Perl',
      createRectTween:
          (begin, end) => CurveRectTween(
            begin: begin,
            end: end,
            curve: Curves.fastOutSlowIn,
          ),
      child: SizedBox(
        height: 3 * radius,
        width: 3 * radius,
        child: Transform.rotate(
          angle: -(pi * 0.5),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: List.generate(count, (index) {
                  double angle = (2 * pi / count) * index;
                  double x = radius * 1.25 + (radius * 0.7) * cos(angle);
                  double y = radius * 0.9 + (radius * 0.7) * sin(angle);

                  Offset scale = scaleAnimations[index].value;
                  Offset move = moveAnimations[index].value;

                  return Positioned(
                    left: x,
                    top: y,
                    child: Transform.rotate(
                      angle: pi / 2.6 + angle,
                      child: Transform(
                        transform:
                            Matrix4.identity()
                              ..scale(scale.dx, scale.dy)
                              ..translate(move.dx, move.dy),
                        alignment: Alignment.bottomCenter,
                        child: CustomPaint(
                          painter: PerlPainter(),
                          size: Size(radius / 2, radius),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
