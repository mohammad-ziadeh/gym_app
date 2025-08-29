import 'package:flutter/material.dart';
import 'package:rive_animation/screens/type_of_workout/components/cards.dart';

class TypeChoose extends StatefulWidget {
  const TypeChoose({super.key});

  @override
  State<TypeChoose> createState() => _TypeChooseState();
}

class _TypeChooseState extends State<TypeChoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Workout Types'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Text(
                'Choose your way\n of workout',
                textAlign: TextAlign.center,
                style: TextStyle(
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
