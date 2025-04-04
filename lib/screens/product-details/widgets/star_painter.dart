import 'dart:math' as math;
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    paint.shader = LinearGradient(
      colors: [
        Colours.yellowColor,
        Colours.yellowLightColor,
        Colours.yellowColor,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
    );

    final Path path = Path();

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double outerRadius = size.width / 2;
    final double innerRadius = outerRadius / 2.5;

    for (int i = 0; i < 8; i++) {
      // 45-degree steps
      final double angle = (math.pi / 4) * i;
      final double radius = (i.isEven) ? outerRadius : innerRadius;

      final double x = centerX + radius * math.cos(angle);
      final double y = centerY + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
