import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FoodStatus extends StatefulWidget {
  const FoodStatus({super.key});

  @override
  State<FoodStatus> createState() => _FoodStatusState();
}

class _FoodStatusState extends State<FoodStatus> {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isDone = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 280,
          ),
          width: MediaQuery.of(context).size.width * 0.95,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  key: ValueKey(isDone ? 'done' : 'preparing'),
                  height: 120,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Transform.scale(
                      scale: 2.2,
                      child: Lottie.asset(
                        isDone
                            ? 'assets/lottie/Food_Done.json'
                            : 'assets/lottie/Preparing_Food.json',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isDone ? "Your Order is Ready!" : "Preparing Your Order...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDone ? Colors.green : Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                isDone
                    ? "Please collect it from the counter."
                    : "This will take a few minutes.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              if (!isDone)
                Transform.scale(
                  scale: 1.5,
                  child: Lottie.asset(
                    'assets/lottie/Loading_Food.json',
                    width: 50,
                    height: 50,
                  ),
                ),
              if (isDone) Text('')
            ],
          ),
        ),
      ),
    );
  }
}
