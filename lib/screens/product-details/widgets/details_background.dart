import 'dart:ui';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class DetailsBackground extends StatelessWidget {
  const DetailsBackground({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: size.width * 0.1,
          bottom: size.height * 0.35,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              height: 200,
              width: 200,

              decoration: BoxDecoration(
                color: Colours.whiteColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.1,
          bottom: size.height * 0.4,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              height: 200,
              width: 200,

              decoration: BoxDecoration(
                color: Colours.whiteColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.2,
          bottom: size.height * 0.4,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: SizedBox(height: 0, width: 0),
          ),
        ),
      ],
    );
  }
}
