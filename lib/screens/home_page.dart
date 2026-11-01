import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../widgets/restaurant_card.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
  TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyword = searchController.text.toLowerCase();

    final filteredRestaurants = restaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(keyword) ||
          restaurant.type.toLowerCase().contains(keyword) ||
          restaurant.location.toLowerCase().contains(keyword);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FoodReserve',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),

              if (cart.isNotEmpty)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${cart.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },

        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'สวัสดี 👋',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'เลือกร้านอาหารที่คุณต้องการ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // ช่องค้นหา
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'ค้นหาร้านอาหาร...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.pink,
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {});
                  },
                )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 22),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ร้านอาหารแนะนำ',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  '${filteredRestaurants.length} ร้าน',
                  style: const TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            if (filteredRestaurants.isEmpty)
              Container(
                padding: const EdgeInsets.all(40),
                child: const Column(
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 70,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'ไม่พบร้านอาหาร',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            else
              ...filteredRestaurants.map(
                    (restaurant) => RestaurantCard(
                  restaurant: restaurant,
                ),
              ),
          ],
        ),
      ),
    );
  }
}