import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class StarTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colours.whiteColor
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
    final path =
        Path()
          ..moveTo(size.width * 0.5, 0)
          ..lineTo(size.width * 0.5, size.height)
          ..moveTo(size.width * 0.15, size.height * 0.15)
          ..lineTo(size.width * 0.85, size.height * 0.85)
          ..moveTo(0, size.height * 0.5)
          ..lineTo(size.width, size.height * 0.5)
          ..moveTo(size.width * 0.85, size.height * 0.15)
          ..lineTo(size.width * 0.15, size.height * 0.85)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
