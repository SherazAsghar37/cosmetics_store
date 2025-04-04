import 'package:flutter/material.dart';

class CurveRectTween extends RectTween {
  CurveRectTween({super.begin, super.end, required this.curve});
  final Curve curve;

  @override
  Rect lerp(double t) {
    return super.lerp(curve.transform(t)) ?? Rect.zero;
  }
}
