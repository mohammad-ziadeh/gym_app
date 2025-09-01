import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/screens/onboding/components/login.dart';

class OnbodingScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const OnbodingScreen({super.key, required this.toggleTheme});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1,
                child: SvgPicture.asset(
                  "assets/icons/logo.svg",
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Login(toggleTheme: widget.toggleTheme)),
        ],
      ),
    );
  }
}
