import 'package:flutter/material.dart';

import '../models/models.dart';
import '../data/app_data.dart';
import '../screens/restaurant_detail_page.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantCard> createState() =>
      _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool get isFavorite {
    return favorites.contains(widget.restaurant);
  }

  void toggleFavorite() {
    setState(() {
      if (favorites.contains(widget.restaurant)) {
        favorites.remove(widget.restaurant);
      } else {
        favorites.add(widget.restaurant);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantDetailPage(
                restaurant: restaurant,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 190,
                  width: double.infinity,
                  child: Image.network(
                    restaurant.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        color: Colors.pink.shade50,
                        child: const Icon(
                          Icons.restaurant,
                          size: 60,
                          color: Colors.pink,
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.pink,
                      ),
                      onPressed: toggleFavorite,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    restaurant.type,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text('${restaurant.rating}'),

                      const SizedBox(width: 16),

                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 4),

                      Text(restaurant.location),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}