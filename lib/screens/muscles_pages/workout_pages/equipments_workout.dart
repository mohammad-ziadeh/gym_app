import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EquipmentWorkout extends StatefulWidget {
  const EquipmentWorkout({super.key});

  @override
  State<EquipmentWorkout> createState() => _EquipmentWorkoutState();
}

class _EquipmentWorkoutState extends State<EquipmentWorkout> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/hamstring_curl.mp4')
          ..initialize().then((_) {
            setState(() {});
            _controller.setLooping(true);
            _controller.setVolume(_isMuted ? 0 : 1);
            _controller.pause();
          });
    _controller2 = VideoPlayerController.asset('assets/videos/squat_side.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller2.setLooping(true);
        _controller2.setVolume(_isMuted ? 0 : 1);
        _controller2.pause();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
      _controller2.value.isPlaying ? _controller2.pause() : _controller2.play();
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
      _controller2.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hamstrings Workout'),
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.white,
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return _controller.value.isInitialized
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: 700,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: AspectRatio(
                                                    aspectRatio: _controller
                                                        .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _controller),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 20,
                                                  bottom: 20,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _isMuted
                                                          ? Icons.volume_off
                                                          : Icons.volume_up,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: _toggleMute,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  bottom: 20,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _controller
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: _togglePlayPause,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'PREPARATION',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Lie face down on the machine. Secure your ankles under the lever pad and hands on the handles.',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'EXECUTION',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '1 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Squeeze your hamstrings to curl your legs up and raise your heels toward your hips, keeping your thighs and hips on the bench.',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '2 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            'Hold for a few seconds at the top position.',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '3 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            'Return to the starting position and repeat.',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'EXECUTION',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '1 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Do not lock out your knees at the bottom.',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 50),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 40.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Done',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: Colors.white,
                                    height: 300,
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  );
                          },
                        );
                      },
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.scale(
                          scale: 1.9,
                          child: Image.asset(
                            'assets/images/1.5.png',
                            width: 50,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Hamstring Curl',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: const Text('2 Sets x 14 Reps',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),

                //2###########################
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.white,
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return _controller2.value.isInitialized
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: 700,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: AspectRatio(
                                                    aspectRatio: _controller2
                                                        .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _controller2),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 20,
                                                  bottom: 20,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _isMuted
                                                          ? Icons.volume_off
                                                          : Icons.volume_up,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: _toggleMute,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  bottom: 20,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _controller2
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: _togglePlayPause,
                                                  ),
                                                ),
                                              ],
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
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: Colors.white,
                                    height: 300,
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  );
                          },
                        );
                      },
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.scale(
                          scale: 2,
                          child: Image.asset(
                            'assets/images/1.4.png',
                            width: 50,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Pendulum Squat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: const Text('2 Sets X 12 Reps',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                //3###########################
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.white,
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return _controller.value.isInitialized
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: 700,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: AspectRatio(
                                                    aspectRatio: _controller
                                                        .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _controller),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 20,
                                                  bottom: 20,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _isMuted
                                                          ? Icons.volume_off
                                                          : Icons.volume_up,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: _toggleMute,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  bottom: 20,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _controller
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: _togglePlayPause,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'PREPARATION',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Lie face down on the machine. Secure your ankles under the lever pad and hands on the handles.',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'EXECUTION',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '1 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Squeeze your hamstrings to curl your legs up and raise your heels toward your hips, keeping your thighs and hips on the bench.',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '2 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            'Hold for a few seconds at the top position.',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '3 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            'Return to the starting position and repeat.',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'EXECUTION',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '1 ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Do not lock out your knees at the bottom.',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 50),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 40.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Done',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: Colors.white,
                                    height: 300,
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  );
                          },
                        );
                      },
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.scale(
                          scale: 1.9,
                          child: Image.asset(
                            'assets/images/1.6.png',
                            width: 50,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Seated Hip Adductor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: const Text(
                        '2 Sets X 12 Reps',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
