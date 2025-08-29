import 'package:flutter/material.dart';
import 'package:rive_animation/screens/type_of_workout/components/cards.dart';

class TypeChose extends StatefulWidget {
  const TypeChose({super.key});

  @override
  State<TypeChose> createState() => _TypeChoseState();
}

class _TypeChoseState extends State<TypeChose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Sidetest Page'),
            backgroundColor: Colors.transparent,
            foregroundColor: Color(0xFFeeeeee)),
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Text(
                'Chose your way\n of workout',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFeeeeee),
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Cards(),
            ],
          ),
        ));
  }
}
