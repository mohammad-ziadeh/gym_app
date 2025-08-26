import 'package:flutter/material.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
          color: Color(0xFFf07d00),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFeeeeee),
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }
}
