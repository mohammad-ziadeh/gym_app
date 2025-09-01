import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../model/menu.dart';
import 'animated_bar.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.navBar,
    required this.press,
    required this.riveOnInit,
    required this.selectedNav,
  });

  final Menu navBar; 
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final Menu selectedNav;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;

    if (navBar.icon != null) {
      iconWidget = Icon(
        navBar.icon,
        size: 30,
        color: selectedNav == navBar ? Colors.white : Colors.grey,
      );
    } else {
      iconWidget = RiveAnimation.asset(
        navBar.rive.src,
        artboard: navBar.rive.artboard,
        onInit: riveOnInit,
      );
    }

    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: iconWidget,
            ),
          ),
        ],
      ),
    );
  }
}
