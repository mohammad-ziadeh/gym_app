import 'package:flutter/material.dart';
import 'package:rive_animation/screens/waiting_events/components/food_status.dart';
import 'package:rive_animation/screens/waiting_events/components/latest_event.dart';

class WaitingRoom extends StatefulWidget {
  const WaitingRoom({super.key});

  @override
  State<WaitingRoom> createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          leading: Text(''),
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              FoodStatus(),
              SizedBox(height: 40),
              const Text(
                'Latest Events',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Events(),
              SizedBox(height: 40),
            ],
          ),
        ));
  }
}
