import 'package:flutter/material.dart';
import 'package:rive_animation/screens/muscles_pages/workout_pages/equipments_workout.dart';

class MusclesEquipmentsPage extends StatefulWidget {
  const MusclesEquipmentsPage({super.key});

  @override
  State<MusclesEquipmentsPage> createState() => _MusclesEquipmentsPageState();
}

class _MusclesEquipmentsPageState extends State<MusclesEquipmentsPage> {
  final List<Map<String, dynamic>> musclesEquipments = [
    {
      'title': 'Hamstrings',
      'subtitle': 'Muscles at back of thigh for knee flexion.',
      'image': 'assets/images/1.1.png',
      'description':
          'Strengthens posterior leg, improves balance and mobility.',
      'route': EquipmentWorkout(),
    },
    {
      'title': 'Lowerback',
      'subtitle': 'Muscles at back of thigh for knee flexion.',
      'image': 'assets/images/1.2.png',
      'description':
          'Strengthens posterior leg, improves balance and mobility.',
      'route': EquipmentWorkout(),
    },
    {
      'title': 'Quads',
      'subtitle': 'Muscles at front of thigh for knee extension.',
      'image': 'assets/images/2.png',
      'description': 'Strengthens anterior leg, improves balance and mobility.',
      'route': EquipmentWorkout(),
    },
    {
      'title': 'Lats',
      'subtitle': 'Muscles at back of shoulder for arm movement.',
      'image': 'assets/images/2.1.png',
      'description': 'Strengthens upper body, improves posture and stability.',
      'route': EquipmentWorkout(),
    },
    {
      'title': 'Triceps',
      'subtitle': 'Muscles at back of upper arm for elbow extension.',
      'image': 'assets/images/2.2.png',
      'description': 'Strengthens upper body, improves posture and stability.',
      'route': EquipmentWorkout(),
    },
    {
      'title': 'Chest',
      'subtitle': 'Muscles at front of upper body for pushing movements.',
      'image': 'assets/images/2.3.png',
      'description': 'Strengthens upper body, improves posture and stability.',
      'route': EquipmentWorkout(),
    },
    {
      'title': 'Front Shoulders',
      'subtitle': 'Muscles at front of shoulder for arm movement.',
      'image': 'assets/images/2.4.png',
      'description': 'Strengthens upper body, improves posture and stability.',
      'route': EquipmentWorkout(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Workout With Equipments'),
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: musclesEquipments.map((muscle) {
                  return Card(
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
                                MaterialPageRoute(
                                  builder: (context) => muscle['route'],
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
                                            padding: const EdgeInsets.only(
                                                top: 16.0),
                                            child: Image.asset(
                                              muscle['image'],
                                              width: 200,
                                              height: 200,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                muscle['description'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
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
                                    muscle['image'],
                                    width: 50,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              muscle['title'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              muscle['subtitle'],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const Positioned(
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
                  );
                }).toList(),
              )),
        ));
  }
}
