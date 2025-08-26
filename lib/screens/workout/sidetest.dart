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
        title: Text('Sidetest Page'),
      ),
      body: Center(
        child: Text(
          'Sidetest Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
