// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';

// class CircularAnimationScreen extends StatefulWidget {
//   const CircularAnimationScreen({super.key});

//   @override
//   _CircularAnimationScreenState createState() =>
//       _CircularAnimationScreenState();
// }

// class _CircularAnimationScreenState extends State<CircularAnimationScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool dataFetched = false;

//   @override
//   void initState() {
//     super.initState();

//     // Animation controller with normal duration
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10),
//     )..forward(); // Start the animation

//     // Linear animation initially
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     // Simulate a delayed fetch
//     Future.delayed(Duration(seconds: 5), () {
//       accelerateAnimation();
//     });
//   }

//   void accelerateAnimation() {
//     if (dataFetched) return;
//     dataFetched = true;

//     double step = 0.01; // Small initial increment
//     Timer.periodic(Duration(milliseconds: 16), (timer) {
//       if (_controller.value >= 1.0) {
//         _controller.value = 1.0;
//         timer.cancel();
//         return;
//       }
//       _controller.value += step;
//       step *= 1.2; // Exponential speed-up
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return CustomPaint(
//               painter: CircularDotPainter(_animation.value),
//               size: Size(200, 200),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class CircularDotPainter extends CustomPainter {
//   final double progress;
//   CircularDotPainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2.5;
//     final paint =
//         Paint()
//           ..color = Colors.blue
//           ..style = PaintingStyle.fill;

//     int dotCount = (progress * 50).toInt(); // Dots increase progressively

//     for (int i = 0; i < dotCount; i++) {
//       double angle = (i / 50) * 2 * pi;
//       double x = center.dx + radius * cos(angle);
//       double y = center.dy + radius * sin(angle);
//       canvas.drawCircle(Offset(x, y), 5, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CircularDotPainter oldDelegate) {
//     return oldDelegate.progress != progress;
//   }
// }

// import 'dart:async';
// import 'dart:math';
// import 'package:cosmetics_store/screens/onboarding-screen/widgets/perl_painter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class OnboardingAnimationScreen extends StatefulWidget {
//   const OnboardingAnimationScreen({super.key});

//   @override
//   State<OnboardingAnimationScreen> createState() =>
//       _OnboardingAnimationScreenState();
// }

// class _OnboardingAnimationScreenState extends State<OnboardingAnimationScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> scaleAnimation;
//   late Animation<Offset> moveAnimation;
//   late Animation<double> counterAnimation;
//   bool dataFetched = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     );

//     scaleAnimation = Tween<Offset>(
//       begin: const Offset(-1, -1),
//       end: const Offset(1.0, 1.0),
//     ).animate(_controller);

//     counterAnimation = Tween<double>(
//       begin: 0,
//       end: 12,
//     ).animate(_controller);

//     _controller.forward();
//     Future.delayed(const Duration(seconds: 5), () {
//       accelerateAnimation();
//     });

//   }

//   void accelerateAnimation() {
//     if (dataFetched) return;
//     dataFetched = true;

//     double step = 0.01;
//     Timer.periodic(const Duration(milliseconds: 16), (timer) {
//       if (_controller.value >= 1.0) {
//         _controller.value = 1.0;
//         timer.cancel();
//         return;
//       }
//       _controller.value += step;
//       step *= 1.2;
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double radius = 40;
//     int count = 12;
//     int selected = 3;
//     double maxDelay = 1000;
//     double decayFactor = 0.25;

//     return Scaffold(
//       backgroundColor: Colors.blue[900],
//       body: Center(
//         child: Transform.rotate(
//           angle: -(pi * 0.5),
//           child: SizedBox(
//             height: 3 * radius,
//             width: 3 * radius,
//             child: Stack(
//               children: List.generate(count, (index) {
//                 double angle = (2 * pi / count) * index;
//                 double x = radius * 1.25 + (radius * 0.9) * cos(angle);
//                 double y = radius + (radius * 0.9) * sin(angle);

//                final scale = counterAnimation.value > index
//                     ? scaleAnimation
//                         .chain(CurveTween(curve: Curves.easeInOut))
//                         .animate(_controller)
//                     : Tween<double>(begin: 0, end: 0).animate(_controller);

//                 return Positioned(
//                   left: x,
//                   top: y,
//                   child: Transform.scale(
//                     scale: scale.value,
//                     alignment: Alignment.bottomCenter,
//                     child: Transform.rotate(
//                       angle: pi / 3 + angle,
//                       child: CustomPaint(
//                         painter: PerlPainter(),
//                         child: const SizedBox(height: 40, width: 20),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
