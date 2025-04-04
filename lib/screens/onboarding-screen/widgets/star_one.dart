import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class StarOne extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colours.whiteColor
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
    final path =
        Path()
          ..moveTo(size.width * 0.2, 0)
          ..lineTo(size.width * 0.9, size.height)
          ..moveTo(size.width * 0.25, size.height * 0.95)
          ..lineTo(size.width * 0.8, size.height * 0.1)
          ..moveTo(size.width, size.height * 0.4)
          ..lineTo(0, size.height * 0.7)
          ..moveTo(size.width * 0.05, size.height * 0.4)
          ..lineTo(size.width * 0.95, size.height * 0.6)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
