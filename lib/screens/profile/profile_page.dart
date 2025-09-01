import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: Text(''),
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 24),
            ProfileMenu(
              text: "My Account",
              icon: Icons.person,
              press: () {},
              textColor: AppColors.orange,
              iconColor: AppColors.orange,
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {},
              textColor: AppColors.orange,
              iconColor: AppColors.orange,
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {},
              textColor: AppColors.orange,
              iconColor: AppColors.orange,
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help_outline,
              press: () {},
              textColor: AppColors.orange,
              iconColor: AppColors.orange,
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {},
              textColor: Colors.red,
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage:
                NetworkImage("https://i.postimg.cc/0jqKB6mS/Profile-Image.png"),
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: Material(
              shape: const CircleBorder(),
              color: AppColors.orange.withOpacity(0.3),
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: iconColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.press,
    this.textColor,
    this.iconColor,
  });

  final String text;
  final IconData icon;
  final VoidCallback? press;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 44, 44, 44),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 18, color: iconColor?.withOpacity(0.6)),
            ],
          ),
        ),
      ),
    );
  }
}
