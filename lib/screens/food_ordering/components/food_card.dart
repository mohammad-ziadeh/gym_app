import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive_animation/constants.dart';

class FoodCard extends StatelessWidget {
  final String category;
  FoodCard({super.key, required this.category});

  final List<Map<String, dynamic>> foods = [
    {
      'name': 'Grilled Chicken Salad',
      'calories': 320,
      'price': 8.99,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=1170',
      'protein': 30,
      'carbs': 15,
      'category': 'Meals'
    },
    {
      'name': 'Grilled Chicken Salad',
      'calories': 320,
      'price': 8.99,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=1170',
      'protein': 30,
      'carbs': 15,
      'category': 'Meals'
    },
    {
      'name': 'Grilled Chicken Salad',
      'calories': 320,
      'price': 8.99,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=1170',
      'protein': 30,
      'carbs': 15,
      'category': 'Meals'
    },
    {
      'name': 'Protein Smoothie',
      'calories': 250,
      'price': 5.49,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=1170',
      'protein': 25,
      'carbs': 10,
      'category': 'Drinks'
    },
    {
      'name': 'Avocado Toast',
      'calories': 180,
      'price': 4.99,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=1170',
      'protein': 8,
      'carbs': 20,
      'category': 'Snacks'
    },
    {
      'name': 'Peanut Butter Bar',
      'calories': 200,
      'price': 2.99,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=1170',
      'protein': 12,
      'carbs': 18,
      'category': 'Snacks'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredFoods =
        foods.where((food) => food['category'] == category).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: filteredFoods.length,
      itemBuilder: (context, index) {
        final food = filteredFoods[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    food['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.fire,
                              size: 14, color: Colors.orange),
                          const SizedBox(width: 6),
                          Text('${food['calories']} kcal',
                              style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                          'Protein: ${food['protein']}g | Carbs: ${food['carbs']}g',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text('\$${food['price']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColors.orange, shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          print('${food['name']} added to cart');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
