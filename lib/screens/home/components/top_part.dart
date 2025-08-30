import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TopPart extends StatefulWidget {
  const TopPart({super.key});

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  late VideoPlayerController _controller;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/Backgrounds/hero_High.mp4')
          ..initialize().then((_) {
            setState(() {});
            _controller.setLooping(true);
            _controller.setVolume(_isMuted ? 0 : 1);
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    double topHeight =
        MediaQuery.of(context).padding.top + kToolbarHeight + 400;

    return SizedBox(
      height: topHeight,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: _controller.value.isInitialized
                ? SizedBox(
                    width: double.infinity,
                    height: topHeight,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    color: const Color.fromARGB(255, 22, 21, 19),
                  ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle,
                    color: Colors.white,
                    size: 29,
                  ),
                  onPressed: _togglePlayPause,
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    _isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                    size: 29,
                  ),
                  onPressed: _toggleMute,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
