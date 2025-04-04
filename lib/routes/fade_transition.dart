import 'package:flutter/material.dart';

class FadeInTransition extends PageRouteBuilder {
  final Widget widget;
  final int? duration;
  FadeInTransition({required this.widget, this.duration})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: Duration(milliseconds: duration ?? 1500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final opacityTween = Tween(
            begin: 0.0,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn));
          final fadeAnimation = animation.drive(opacityTween);
          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      );
}
