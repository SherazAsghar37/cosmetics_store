import 'package:flutter/material.dart';

class PerlPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 0.1
          ..style = PaintingStyle.fill
          ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1);

    final path =
        Path()
          ..moveTo(0, size.height)
          ..quadraticBezierTo(
            size.width * 1.1,
            size.height * 0.4,
            size.width * 0.9,
            size.height * 0.2,
          )
          ..quadraticBezierTo(
            size.width * 0.7,
            0,
            size.width * 0.45,
            size.height * 0.2,
          )
          ..quadraticBezierTo(
            size.width * 0.25,
            size.height * 0.6,
            0,
            size.height,
          )
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
