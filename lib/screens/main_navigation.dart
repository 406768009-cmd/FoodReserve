import 'package:flutter/material.dart';

import '../data/app_data.dart';
import 'home_page.dart';
import 'favorite_page.dart';
import 'booking_list_page.dart';
import 'profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (selectedIndex == 0) {
      page = const HomePage();
    } else if (selectedIndex == 1) {
      page = FavoritePage(
        key: ValueKey(favorites.length),
      );
    } else if (selectedIndex == 2) {
      page = BookingListPage(
        key: ValueKey(bookings.length),
      );
    } else {
      page = const ProfilePage();
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFFD7E5),
        onDestinationSelected: changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home,
              color: Color(0xFFE91E63),
            ),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(
              Icons.favorite,
              color: Color(0xFFE91E63),
            ),
            label: 'รายการโปรด',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(
              Icons.calendar_month,
              color: Color(0xFFE91E63),
            ),
            label: 'การจอง',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person,
              color: Color(0xFFE91E63),
            ),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}