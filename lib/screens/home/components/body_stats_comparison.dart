import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyStatsComparison extends StatelessWidget {
  final Map<String, Map<String, dynamic>> stats = {
    'Weight': {'current': 72, 'previous': 74, 'unit': 'kg'},
    'Body Fat': {'current': 18, 'previous': 20, 'unit': '%'},
    'Muscle': {'current': 38, 'previous': 37, 'unit': 'kg'},
    'Water': {'current': 55, 'previous': 54, 'unit': '%'},
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF07D00), Color(0xFFFB9E00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: stats.keys.map((metric) {
          final data = stats[metric]!;
          double current = data['current'].toDouble();
          double previous = data['previous'].toDouble();

          bool isDecreaseGood = metric == 'Weight' || metric == 'Body Fat';
          bool improved =
              isDecreaseGood ? current < previous : current > previous;

          IconData arrowIcon = isDecreaseGood
              ? (improved
                  ? FontAwesomeIcons.arrowDown
                  : FontAwesomeIcons.arrowUp)
              : (improved
                  ? FontAwesomeIcons.arrowUp
                  : FontAwesomeIcons.arrowDown);

          Color arrowColor = improved ? Colors.green : Colors.red;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    metric,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$current ${data['unit']}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: arrowColor,
                            ),
                          ),
                          Text(
                            "Before: $previous",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Icon(arrowIcon, color: arrowColor, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
