import 'package:flutter/material.dart';

class FadeInTransition extends PageRouteBuilder {
  final Widget widget;
  FadeInTransition({required this.widget})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: const Duration(milliseconds: 1500),
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
