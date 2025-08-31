import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rive_animation/constants.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final List<Map<String, dynamic>> events = [
    {
      "title": "Food and health",
      "details": "What is food to health and why?",
      "date": DateTime.now().add(const Duration(days: 1)),
      "color": Colors.orange
    },
    {
      "title": "Celebrating New Year",
      "details":
          "Welcoming the New Year with our best shapes and fitness goals.",
      "date": DateTime.now().add(const Duration(days: 3)),
      "color": Colors.orange
    },
    {
      "title": "Fitness Workshop",
      "details": "Join us for a day of fitness and fun!",
      "date": DateTime.now().add(const Duration(days: 5)),
      "color": Colors.orange
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        String formattedDate = DateFormat('EEE, MMM d').format(event['date']);

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InkWell(
            onTap: () {
              _showEventDetails(context, event);
            },
            borderRadius: BorderRadius.circular(16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              shadowColor: event['color'].withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: event['color'].withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.event, color: event['color'], size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['title'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            event['details'],
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 16, color: AppColors.orange),
                              const SizedBox(width: 4),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.orange),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: AppColors.orange)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEventDetails(BuildContext context, Map<String, dynamic> event) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event['title'],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(event['details'], style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: event['color']),
                  const SizedBox(width: 8),
                  Text(DateFormat('EEE, MMM d, yyyy').format(event['date']),
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: event['color'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Close', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
