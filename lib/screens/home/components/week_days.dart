import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';

class WeekDaysWorkout extends StatefulWidget {
  const WeekDaysWorkout({super.key});

  @override
  State<WeekDaysWorkout> createState() => _WeekDaysWorkoutState();
}

class _WeekDaysWorkoutState extends State<WeekDaysWorkout> {
  late PageController _pageController;
  double _currentPage = 0.0;

  final List<Map<String, String>> week = [
    {"day": "Sun", "activity": "Legs"},
    {"day": "Mon", "activity": "Chest"},
    {"day": "Tue", "activity": "Back"},
    {"day": "Wed", "activity": "Shoulders"},
    {"day": "Thu", "activity": "Arms"},
    {"day": "Fri", "activity": "Rest"},
    {"day": "Sat", "activity": "Cardio"},
  ];

  @override
  void initState() {
    super.initState();
    int todayIndex = DateTime.now().weekday % 7;
    _pageController =
        PageController(viewportFraction: 0.35, initialPage: todayIndex);
    _currentPage = todayIndex.toDouble();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? _currentPage;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: week.length,
        itemBuilder: (context, index) {
          double distanceFromCenter = (_currentPage - index).abs();
          double scale = (1 - (distanceFromCenter * 0.4)).clamp(0.8, 1.0);

          return Center(
            child: Transform.scale(
              scale: scale,
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Card(
                  color: AppColors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                          color: const Color.fromARGB(139, 109, 65, 0),
                          width: 4)),
                  elevation: 4,
                  child: SizedBox(
                    width: 140,
                    height: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            week[index]['day']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            week[index]['activity']!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
