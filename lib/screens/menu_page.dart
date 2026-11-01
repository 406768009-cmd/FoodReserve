import 'package:flutter/material.dart';

import '../models/models.dart';
import '../data/app_data.dart';
import '../widgets/food_card.dart';
import 'cart_page.dart';

class MenuPage extends StatefulWidget {
  final Restaurant restaurant;
  final bool bookingDone;

  const MenuPage({
    super.key,
    required this.restaurant,
    this.bookingDone = false,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final searchController = TextEditingController();

  String selectedCategory = 'ทั้งหมด';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      'ทั้งหมด',
      ...foods.map((e) => e.category).toSet(),
    ];

    final keyword =
    searchController.text.toLowerCase();

    final filteredFoods = foods.where((food) {
      final matchSearch =
      food.name.toLowerCase().contains(keyword);

      final matchCategory =
          selectedCategory == 'ทั้งหมด' ||
              food.category == selectedCategory;

      return matchSearch && matchCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          Stack(
            children: [
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
              if (cart.isNotEmpty)
                Positioned(
                  right: 4,
                  top: 4,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${cart.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.bookingDone)
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'จองร้านอาหารสำเร็จแล้ว สามารถเลือกเมนูอาหารได้เลย',
                    ),
                  ),
                ],
              ),
            ),

          TextField(
            controller: searchController,
            onChanged: (_) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'ค้นหาเมนูอาหาร...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Padding(
                  padding:
                  const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected:
                    selectedCategory == category,
                    selectedColor:
                    Colors.pink.shade100,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'เมนูอาหาร ${filteredFoods.length} รายการ',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...filteredFoods.map(
                (food) => FoodCard(
              food: food,
              showAddButton: true,
            ),
          ),
        ],
      ),
    );
  }
}