import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colours.whiteColor
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.5;
    final circlePath =
        Path()..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.drawPath(circlePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
