import 'package:flutter/material.dart';

class EquipmentsWorkout extends StatefulWidget {
  const EquipmentsWorkout({super.key});

  @override
  State<EquipmentsWorkout> createState() => _EquipmentsWorkoutState();
}

class _EquipmentsWorkoutState extends State<EquipmentsWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Workout With Equipments'),
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFFeeeeee),
        ),
        body: SingleChildScrollView(
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
                        onTap: () {},
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
                        title: const Text('Hamstrings'),
                        subtitle: const Text(
                            'Muscles at back of thigh for knee flexion.'),
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
                        onTap: () {},
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
                        title: const Text('Lowerback'),
                        subtitle: const Text(
                            'Muscles at back of thigh for knee flexion.'),
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
        ));
  }
}
