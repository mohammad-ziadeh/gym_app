import 'dart:ui';
import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const Glass({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50), // Rounded corners
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur intensity
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // Glass color
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
