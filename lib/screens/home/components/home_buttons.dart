import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeButtons extends StatefulWidget {
  const HomeButtons({super.key});

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons>
    with TickerProviderStateMixin {
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: const Color(0xFF1B1A17),
        height: 200,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 165,
              width: 165,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFf07d00)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pushNamed('/chose');
                  },
                  splashColor: const Color.fromARGB(255, 223, 115, 0),
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Transform.scale(
                          scale: 0.8,
                          child: Lottie.asset(
                            frameRate: FrameRate.max,
                            'assets/lottie/Food.json',
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
                      const Positioned(
                        bottom: 10,
                        child: Text('Order Food',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Container(
              height: 165,
              width: 165,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFf07d00)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pushNamed('/chose');
                  },
                  splashColor: const Color.fromARGB(255, 223, 115, 0),
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Transform.scale(
                          scale: 1.7,
                          child: Lottie.asset(
                            frameRate: FrameRate.max,
                            'assets/lottie/Dumbbell.json',
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
                      const Positioned(
                        bottom: 10,
                        child: Text('Workout',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
