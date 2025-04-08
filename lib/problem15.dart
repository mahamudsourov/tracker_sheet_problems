import 'package:flutter/material.dart';

void main() {
  runApp(const DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  const DateTimePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date & Time Picker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DateTimePickerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateText = selectedDate != null
        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
        : "No date selected";

    String timeText = selectedTime != null
        ? selectedTime!.format(context)
        : "No time selected";

    return Scaffold(
      appBar: AppBar(title: const Text("Pick Date & Time")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selected Date: $dateText", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text("Pick Date"),
            ),
            const SizedBox(height: 30),
            Text("Selected Time: $timeText", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _pickTime,
              child: const Text("Pick Time"),
            ),
          ],
        ),
      ),
    );
  }
}
