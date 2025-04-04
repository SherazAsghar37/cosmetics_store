import 'package:flutter/material.dart';

class OvalPainter extends CustomPainter {
  final Color color;
  OvalPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final oval = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawOval(oval, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
