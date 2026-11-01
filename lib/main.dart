import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const FoodReserveApp());
}

class FoodReserveApp extends StatelessWidget {
  const FoodReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodReserve',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFFFF7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const LoginPage(),
    );
  }
}