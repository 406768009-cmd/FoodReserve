import 'package:flutter/material.dart';

import '../data/app_data.dart';

class BookingListPage extends StatelessWidget {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'การจองของฉัน',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: bookings.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month_outlined,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              'ยังไม่มีรายการจอง',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];

          return Card(
            margin: const EdgeInsets.only(
              bottom: 14,
            ),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.restaurant,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          booking.restaurant.name,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 25),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${booking.date.day}/${booking.date.month}/${booking.date.year + 543}',
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 8),
                      Text(booking.time.format(context)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        size: 20,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${booking.people} คน',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}