import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import '../../../model/menu.dart';
import '../../../utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  final ValueChanged<int> onMenuSelected;
  final Menu selectedMenu;
  final VoidCallback onToggleTheme; // ✅ NEW
  final VoidCallback onChangeLanguage; // ✅ NEW

  const SideBar({
    super.key,
    required this.onMenuSelected,
    required this.selectedMenu,
    required this.onToggleTheme, // ✅
    required this.onChangeLanguage, // ✅
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.darkBackground,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(name: "Abu Anwar", bio: "YouTuber"),

                // Browse section
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    "Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus.asMap().entries.map((entry) {
                  int index = entry.key;
                  Menu menu = entry.value;
                  return SideMenu(
                    menu: menu,
                    selectedMenu: selectedSideMenu,
                    press: () {
                      RiveUtils.chnageSMIBoolState(menu.rive.status!);
                      setState(() {
                        selectedSideMenu = menu;
                      });
                      widget.onMenuSelected(index);
                    },
                    riveOnInit: (artboard) {
                      menu.rive.status = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: menu.rive.stateMachineName,
                      );
                    },
                  );
                }),

                // History section
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                  child: Text(
                    "History".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus2.asMap().entries.map((entry) {
                  int index = sidebarMenus.length + entry.key;
                  Menu menu = entry.value;
                  return SideMenu(
                    menu: menu,
                    selectedMenu: selectedSideMenu,
                    press: () {
                      RiveUtils.chnageSMIBoolState(menu.rive.status!);
                      setState(() {
                        selectedSideMenu = menu;
                      });
                      widget.onMenuSelected(index);
                    },
                    riveOnInit: (artboard) {
                      menu.rive.status = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: menu.rive.stateMachineName,
                      );
                    },
                  );
                }),

                const Spacer(),

                const Divider(color: Colors.white54),
                ListTile(
                  leading: const Icon(Icons.brightness_6, color: Colors.white),
                  title: const Text(
                    "Toggle Theme",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: widget.onToggleTheme,
                ),
                ListTile(
                  leading: const Icon(Icons.language, color: Colors.white),
                  title: const Text(
                    "Change Language",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: widget.onChangeLanguage,
                ),
              ],
            )),
      ),
    );
  }
}
