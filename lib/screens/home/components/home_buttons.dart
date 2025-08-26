import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeButtons extends StatefulWidget {
  const HomeButtons({super.key});

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  bool _isLoaded1 = false;
  bool _isLoaded2 = false;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(vsync: this);
    _controller2 = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _playFullAnimation1() {
    if (_isLoaded1) {
      _controller1
        ..reset()
        ..forward();
    }
  }

  void _playFullAnimation2() {
    if (_isLoaded2) {
      _controller2
        ..reset()
        ..forward();
    }
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
                  onTap: _playFullAnimation2,
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
                            'assets/lottie/Food.json',
                            controller: _controller2,
                            animate: false,
                            onLoaded: (composition) {
                              _controller2.duration = composition.duration;

                              _controller2.value = 0.5;

                              setState(() => _isLoaded2 = true);
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
                    _playFullAnimation1;
                    await Future.delayed(Duration(seconds: 1));
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
                            'assets/lottie/Dumbbell.json',
                            controller: _controller1,
                            animate: false,
                            onLoaded: (composition) {
                              _controller1.duration = composition.duration;
                              setState(() => _isLoaded1 = true);
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
