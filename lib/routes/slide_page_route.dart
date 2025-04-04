import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget widget;
  SlidePageRoute({required this.widget})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: const Duration(milliseconds: 1500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}
