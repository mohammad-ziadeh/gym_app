import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/home/home_screen.dart';
import 'package:rive_animation/screens/profile/profile_page.dart';
import 'package:rive_animation/screens/type_of_workout/sidetest.dart';
import 'package:rive_animation/screens/type_of_workout/workout_choose.dart';
import 'package:rive_animation/screens/waiting_events/waiting_room.dart';
import 'package:rive_animation/screens/food_ordering/food_ordering_page.dart';
import 'package:rive_animation/utils/rive_utils.dart';

import '../../model/menu.dart';
import 'components/btm_nav_item.dart';
import 'components/menu_btn.dart';
import 'components/side_bar.dart';

class EntryPoint extends StatefulWidget {
  final VoidCallback toggleTheme;
  const EntryPoint({super.key, required this.toggleTheme});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  late SMIBool isMenuOpenInput;

  int selectedBottomIndex = 0;
  int selectedSideIndex = 0;

  /// Bottom nav pages
  final List<Widget> bottomNavPages = [
    const HomePage(),
    const TypeChoose(),
    const WaitingRoom(),
    const FoodPage(),
    const ProfileScreen(),
  ];

  /// Sidebar pages
  final List<Widget> sideBarPages = [
    const HomePage(),
    const Sidetest(), // make it the follow your plan
    const WaitingRoom(),
    const FoodPage(),
  ];

  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectBottomNav(int index, Menu navBar) {
    if (navBar.rive.status != null) {
      RiveUtils.chnageSMIBoolState(navBar.rive.status!);
    }
    setState(() {
      selectedBottomIndex = index;
    });
  }

  void selectSideMenu(int index) {
    if (index >= sideBarPages.length) return;

    if (isSideBarOpen) {
      _animationController.reverse();
      isSideBarOpen = false;
      isMenuOpenInput.value = false;
    }

    int bottomIndex = bottomNavPages.indexWhere(
        (page) => page.runtimeType == sideBarPages[index].runtimeType);

    if (bottomIndex != -1) {
      setState(() {
        selectedBottomIndex = bottomIndex;
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => sideBarPages[index],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          /// Sidebar
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child: SideBar(
              selectedMenu: selectedSideIndex < sidebarMenus.length
                  ? sidebarMenus[selectedSideIndex]
                  : sidebarMenus[0],
              onMenuSelected: (menuIndex) {
                selectSideMenu(menuIndex);
              },
              onToggleTheme: () {
                widget.toggleTheme();
              },
              onChangeLanguage: () {
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
            ),
          ),

          /// Main content
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(1 * slideAnimation.value -
                  30 * slideAnimation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(slideAnimation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: bottomNavPages[selectedBottomIndex],
                ),
              ),
            ),
          ),

          /// Menu button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 220 : 0,
            top: 16,
            child: MenuBtn(
              press: () {
                if (selectedSideIndex < sideBarPages.length) {
                  if (_animationController.value == 0) {
                    _animationController.forward();
                    isMenuOpenInput.value = false;
                  } else {
                    _animationController.reverse();
                    isMenuOpenInput.value = true;
                  }

                  setState(() {
                    isSideBarOpen = !isSideBarOpen;
                  });
                }
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                  artboard,
                  "State Machine",
                );
                artboard.addController(controller!);

                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;

                isMenuOpenInput.value = isSideBarOpen;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * slideAnimation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 56, 51).withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkBackground.withOpacity(0.3),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: bottomNavItems.asMap().entries.map((entry) {
                int index = entry.key;
                Menu navBar = entry.value;
                return BtmNavItem(
                  navBar: navBar,
                  press: () => selectBottomNav(index, navBar),
                  riveOnInit: (artboard) {
                    navBar.rive.status = RiveUtils.getRiveInput(
                      artboard,
                      stateMachineName: navBar.rive.stateMachineName,
                    );
                  },
                  selectedNav: bottomNavItems[selectedBottomIndex],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
