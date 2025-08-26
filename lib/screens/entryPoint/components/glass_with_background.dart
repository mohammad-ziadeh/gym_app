import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  // final Color backgroundColor; // Add background color

  const GlassContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    // this.backgroundColor = Color(0xFF5e5858),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: backgroundColor,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), // Glass color
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
