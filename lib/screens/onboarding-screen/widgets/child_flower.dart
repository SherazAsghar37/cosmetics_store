import 'dart:math';
import 'package:cosmetics_store/utils/curved_rect_tween.dart';
import 'package:flutter/material.dart';
import 'package:cosmetics_store/screens/onboarding-screen/widgets/perl_painter.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ChildFlower extends StatelessWidget {
  const ChildFlower({super.key});

  @override
  Widget build(BuildContext context) {
    double childRadius = 14;
    double parentRadius = 35;
    timeDilation = 2;
    int count = 12;
    return Hero(
      tag: 'Perl',
      createRectTween:
          (begin, end) => CurveRectTween(
            begin: begin,
            end: end,
            curve: Curves.fastOutSlowIn,
          ),
      child: SizedBox(
        height: 3 * childRadius,
        width: 3 * childRadius,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double radius = constraints.maxHeight / 3;

            double scaler =
                ((constraints.maxHeight - (3 * childRadius)) /
                    ((3 * parentRadius) - (3 * childRadius)));
            double angleFactor = (2.2 + (scaler * (2.6 - 2.2)));
            double rotationFactor = (0.65 + (scaler * (0.7 - 0.65)));
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxHeight,
              child: Transform.rotate(
                angle: -(pi * 0.5),
                child: Stack(
                  children: List.generate(count, (index) {
                    double angle = (2 * pi / count) * index;
                    double x =
                        radius * 1.25 + (radius * rotationFactor) * cos(angle);
                    double y =
                        radius * 0.9 + (radius * rotationFactor) * sin(angle);

                    Offset scale = (Offset(1, 1));
                    Offset move = Offset(5, -2);

                    return Positioned(
                      left: x,
                      top: y,
                      child: Transform.rotate(
                        angle: pi / angleFactor + angle,
                        child: Transform(
                          transform:
                              Matrix4.identity()
                                ..scale(scale.dx, scale.dy)
                                ..translate(move.dx, move.dy),
                          alignment: Alignment.bottomCenter,
                          child: CustomPaint(
                            painter: PerlPainter(),
                            size: Size((radius / 2), (radius)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
