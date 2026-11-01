import 'package:flutter/material.dart';

import '../models/models.dart';
import '../data/app_data.dart';
import 'menu_page.dart';

class BookingPage extends StatefulWidget {
  final Restaurant restaurant;

  const BookingPage({
    super.key,
    required this.restaurant,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(
    hour: 18,
    minute: 0,
  );

  int people = 2;

  Future<void> selectDate() async {
    final result = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (result != null) {
      setState(() {
        selectedDate = result;
      });
    }
  }

  Future<void> selectTime() async {
    final result = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (result != null) {
      setState(() {
        selectedTime = result;
      });
    }
  }

  void confirmBooking() {
    bookings.add(
      Booking(
        restaurant: widget.restaurant,
        date: selectedDate,
        time: selectedTime,
        people: people,
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MenuPage(
          restaurant: widget.restaurant,
          bookingDone: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จองร้านอาหาร'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.restaurant.image,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            widget.restaurant.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.pink,
              ),
              title: const Text('วันที่'),
              subtitle: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year + 543}',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: selectDate,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.access_time,
                color: Colors.pink,
              ),
              title: const Text('เวลา'),
              subtitle: Text(
                selectedTime.format(context),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: selectTime,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.people,
                color: Colors.pink,
              ),
              title: const Text('จำนวนคน'),
              subtitle: Text('$people คน'),
              trailing: DropdownButton<int>(
                value: people,
                items: List.generate(
                  20,
                      (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      people = value;
                    });
                  }
                },
              ),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: confirmBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'ยืนยันการจอง',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}