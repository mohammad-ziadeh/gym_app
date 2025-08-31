import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/food_ordering/components/food_card.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Food Ordering'),
          bottom: TabBar(
            labelColor: AppColors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.orange,
            tabs: [
              Tab(text: 'Meals'),
              Tab(text: 'Snacks'),
              Tab(text: 'Drinks'),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: [
            FoodCard(category: 'Meals'),
            FoodCard(category: 'Snacks'),
            FoodCard(category: 'Drinks'),
          ],
        ),
      ),
    );
  }
}
