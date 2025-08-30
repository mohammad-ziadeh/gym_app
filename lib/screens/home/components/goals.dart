// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:rive_animation/constants.dart';

// class AutoScrollCards extends StatefulWidget {
//   const AutoScrollCards({super.key});

//   @override
//   State<AutoScrollCards> createState() => _AutoScrollCardsState();
// }

// class _AutoScrollCardsState extends State<AutoScrollCards> {
//   final ScrollController _scrollController = ScrollController();
//   final List<String> items = ["Goal 1", "Goal 2", "Goal 3", "Goal 4", "Goal 5"];
//   double scrollSpeed = 0.5; // pixels per tick
//   Timer? _timer;
//   late List<String> loopItems;

//   @override
//   void initState() {
//     super.initState();
//     // Duplicate the items to allow seamless looping
//     loopItems = [...items, ...items];
//     WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(milliseconds: 20), (_) {
//       if (_scrollController.hasClients) {
//         double maxScroll = _scrollController.position.maxScrollExtent / 2;
//         double current = _scrollController.offset + scrollSpeed;

//         if (current >= maxScroll) {
//           // Reset position back to start seamlessly
//           _scrollController.jumpTo(current - maxScroll);
//         } else {
//           _scrollController.jumpTo(current);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: loopItems.length,
//         itemBuilder: (context, index) {
//           return Container(
//             width: 140,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             decoration: BoxDecoration(
//               color: AppColors.orange,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 6,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 loopItems[index],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
