import 'package:flutter/material.dart';

import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final IconData? icon;

  Menu({required this.title, required this.rive, this.icon});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "Search",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu(
    title: "Favorites",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
];
List<Menu> sidebarMenus2 = [
  Menu(
    title: "History",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  // Menu(
  //   title: "Notifications",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "BELL",
  //       stateMachineName: "BELL_Interactivity"),
  // ),
];

List<Menu> bottomNavItems = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "Search",
    icon: Icons.fitness_center_outlined,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu(
    title: "Timer",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "Notification",
    icon: Icons.fastfood_outlined,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
  Menu(
    title: "Profile",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity"),
  ),
];
