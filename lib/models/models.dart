import 'package:flutter/material.dart';

class Restaurant {
  final String name;
  final String type;
  final String image;
  final double rating;
  final String location;

  Restaurant({
    required this.name,
    required this.type,
    required this.image,
    required this.rating,
    required this.location,
  });
}

class FoodItem {
  final String name;
  final String category;
  final int price;
  final String image;
  final String description;

  FoodItem({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
  });
}

class Booking {
  final Restaurant restaurant;
  final DateTime date;
  final TimeOfDay time;
  final int people;

  Booking({
    required this.restaurant,
    required this.date,
    required this.time,
    required this.people,
  });
}