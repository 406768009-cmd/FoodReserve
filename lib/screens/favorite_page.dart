import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../widgets/restaurant_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ร้านโปรด',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: favorites.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              'ยังไม่มีร้านโปรด',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...favorites.map(
                (restaurant) => RestaurantCard(
              restaurant: restaurant,
            ),
          ),
        ],
      ),
    );
  }
}