import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/screens/muscles_pages/muscles_workout_page.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> with TickerProviderStateMixin {
  final Color backColor = const Color(0xFFf07d00);
  final Color textColor = const Color(0xFFeeeeee);
  final Color lightBackColor = const Color.fromARGB(255, 201, 104, 0);

  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(vsync: this);
    _controller2 = AnimationController(vsync: this);
    _controller3 = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Material(
            color: backColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              splashColor: lightBackColor,
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const MusclesEquipmentsPage(),
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder: (_, animation, __, child) {
                      final curvedAnimation = CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      );

                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).animate(curvedAnimation),
                        child: FadeTransition(
                          opacity: curvedAnimation,
                          child: child,
                        ),
                      );
                    },
                  ),
                );
              },
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
                          fontSize: 18,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Lottie.asset(
                            'assets/lottie/fitness.json',
                            controller: _controller1,
                            frameRate: FrameRate.max,
                            onLoaded: (composition) {
                              _controller1
                                ..duration = composition.duration * 2
                                ..forward();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Material(
            color: backColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              splashColor: lightBackColor,
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).pushNamed('/noEquipment');
              },
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
                          fontSize: 18,
                          color: Color(0xFFeeeeee),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 2.5,
                        child: Lottie.asset(
                          'assets/lottie/Error.json',
                          controller: _controller2,
                          frameRate: FrameRate.max,
                          onLoaded: (composition) {
                            _controller2
                              ..duration = composition.duration
                              ..forward();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Material(
            color: backColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              splashColor: lightBackColor,
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).pushNamed('/plan');
              },
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
                          fontSize: 18,
                          color: Color(0xFFeeeeee),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.3,
                        child: Lottie.asset(
                          'assets/lottie/FollowPlan.json',
                          controller: _controller3,
                          frameRate: FrameRate.max,
                          onLoaded: (composition) {
                            _controller3
                              ..duration = composition.duration
                              ..forward();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
