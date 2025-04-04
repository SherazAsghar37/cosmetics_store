import 'dart:math' as math;
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class WavyCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Colours.primaryColor, Colours.secondaryColor],
    ).createShader(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
    );

    double numberOfPoints = 9;
    double outerCurveRadius = size.width / 1.85;
    double innerCurveRadius = size.width / 2.5;

    double width = size.width;
    double halfWidth = width / 2;
    double radius = halfWidth / 1.12;

    double degreesPerStep = math.pi / numberOfPoints;
    double halfDegreesPerStep = degreesPerStep / 2;

    int counter = 0;
    double max = 2 * math.pi;

    var path = Path();

    path.moveTo(
      halfWidth + radius * math.cos(0 + halfDegreesPerStep),
      halfWidth + radius * math.sin(0 + halfDegreesPerStep),
    );

    for (double step = 0; step < max + 1; step += degreesPerStep) {
      if (counter.isEven) {
        path.quadraticBezierTo(
          halfWidth + outerCurveRadius * math.cos(step),
          halfWidth + outerCurveRadius * math.sin(step),
          halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep),
        );
      } else {
        path.quadraticBezierTo(
          halfWidth + innerCurveRadius * math.cos(step),
          halfWidth + innerCurveRadius * math.sin(step),
          halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep),
        );
      }
      counter++;
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
