import 'package:flutter/material.dart';
import 'package:rive_animation/screens/home/components/body_stats_comparison.dart';
// import 'package:rive_animation/screens/home/components/goals.dart';
import 'package:rive_animation/screens/home/components/week_days.dart';
import 'package:rive_animation/screens/home/components/top_part.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopPart(),
                  SizedBox(height: 15),
                  WeekDaysWorkout(),
                  SizedBox(height: 15),
                  BodyStatsComparison(),
                  SizedBox(height: 50),
                  // AutoScrollCards(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
