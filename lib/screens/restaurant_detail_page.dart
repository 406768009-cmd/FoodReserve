import 'package:flutter/material.dart';

import '../models/models.dart';
import '../data/app_data.dart';
import '../widgets/food_card.dart';
import 'booking_page.dart';
import 'menu_page.dart';
import 'cart_page.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({
    super.key,
    required this.restaurant,
  });

  bool get isFavorite {
    return favorites.contains(restaurant);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.pink,
            actions: [
              IconButton(
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () {
                  if (favorites.contains(restaurant)) {
                    favorites.remove(restaurant);
                  } else {
                    favorites.add(restaurant);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        favorites.contains(restaurant)
                            ? 'เพิ่มในรายการโปรดแล้ว'
                            : 'นำออกจากรายการโปรดแล้ว',
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartPage(),
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(restaurant.name),
              background: Image.network(
                restaurant.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: Colors.pink.shade100,
                    child: const Icon(
                      Icons.restaurant,
                      size: 70,
                      color: Colors.pink,
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.type,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text('${restaurant.rating}'),

                      const SizedBox(width: 20),

                      const Icon(
                        Icons.location_on,
                        color: Colors.pink,
                      ),
                      Text(restaurant.location),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookingPage(
                                  restaurant: restaurant,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                          ),
                          label: const Text('จองร้านนี้'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            padding:
                            const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MenuPage(
                                  restaurant: restaurant,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.restaurant_menu,
                          ),
                          label: const Text('ดูเมนูอาหาร'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            padding:
                            const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'เมนูแนะนำ',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...foods.take(4).map(
                        (food) => FoodCard(
                      food: food,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}