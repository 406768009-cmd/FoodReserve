import 'package:flutter/material.dart';

import '../models/models.dart';
import '../data/app_data.dart';

class FoodCard extends StatefulWidget {
  final FoodItem food;
  final bool showAddButton;

  const FoodCard({
    super.key,
    required this.food,
    this.showAddButton = true,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  void addToCart() {
    cart.add(widget.food);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${widget.food.name} เพิ่มลงตะกร้าแล้ว',
        ),
        duration: const Duration(seconds: 1),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                food.image,
                width: 95,
                height: 95,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: 95,
                    height: 95,
                    color: Colors.pink.shade50,
                    child: const Icon(
                      Icons.fastfood,
                      color: Colors.pink,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    food.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    '฿${food.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            if (widget.showAddButton)
              IconButton(
                onPressed: addToCart,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.add),
              ),
          ],
        ),
      ),
    );
  }
}