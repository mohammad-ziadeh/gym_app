import 'package:flutter/material.dart';
import 'package:rive_animation/screens/muscles_pages/workout_pages/equipments_workout.dart';

class MusclesEquipmentsPage extends StatefulWidget {
  const MusclesEquipmentsPage({super.key});

  @override
  State<MusclesEquipmentsPage> createState() => _MusclesEquipmentsPageState();
}

class _MusclesEquipmentsPageState extends State<MusclesEquipmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Workout With Equipments'),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          splashColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const EquipmentWorkout(),
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                transitionsBuilder: (_, animation, __, child) {
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInOut,
                                  );

                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1, 0),
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
                          leading: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: 300,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: Image.asset(
                                            'assets/images/1.1.png',
                                            width: 200,
                                            height: 200,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                'Strengthens posterior leg, improves balance and mobility.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 1.9,
                                child: Image.asset(
                                  'assets/images/1.1.png',
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                          title: const Text(
                            'Hamstrings',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'Muscles at back of thigh for knee flexion.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 25,
                        child: Icon(
                          Icons.info,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // the second test card {{{ /// /// }}}
                Card(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          splashColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EquipmentWorkout(),
                              ),
                            );
                          },
                          leading: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: 300,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: Image.asset(
                                            'assets/images/1.2.png',
                                            width: 200,
                                            height: 200,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                'Strengthens posterior leg, improves balance and mobility.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 1.9,
                                child: Image.asset(
                                  'assets/images/1.2.png',
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                          title: const Text(
                            'Lowerback',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'Muscles at back of thigh for knee flexion.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 25,
                        child: Icon(
                          Icons.info,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
