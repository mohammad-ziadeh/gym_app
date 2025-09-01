import 'package:flutter/material.dart';

class Sidetest extends StatefulWidget {
  const Sidetest({super.key});

  @override
  State<Sidetest> createState() => _SidetestState();
}

class _SidetestState extends State<Sidetest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Daily Workouut'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          'Your Daily Workouut',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
