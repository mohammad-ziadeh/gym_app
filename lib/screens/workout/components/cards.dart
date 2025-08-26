import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> with TickerProviderStateMixin {
  final Color backColor = const Color(0xFFf07d00);
  final Color textColor = const Color(0xFFeeeeee);

  late AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backColor,
            ),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Workout With Equipments',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 50),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Lottie.asset(
                          frameRate: FrameRate(90),
                          'assets/lottie/fitness.json',
                          controller: _lottieController,
                          onLoaded: (composition) {
                            _lottieController
                              ..duration = composition.duration * 2
                              ..forward();
                            // Loop forever
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backColor,
            ),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'No Equipments Workout',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFeeeeee),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Transform.scale(
                      scale: 3,
                      child: Lottie.asset(
                        frameRate: FrameRate(90),
                        'assets/lottie/Error.json',
                        controller: _lottieController,
                        onLoaded: (composition) {
                          _lottieController
                            ..duration = composition.duration * 0.9
                            ..forward();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backColor,
            ),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Follow Your Plan',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFeeeeee),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 120),
                    Transform.scale(
                      scale: 1.3,
                      child: Lottie.asset(
                        frameRate: FrameRate(90),
                        'assets/lottie/FollowPlan.json',
                        controller: _lottieController,
                        onLoaded: (composition) {
                          _lottieController
                            ..duration = composition.duration * 1
                            ..forward();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
