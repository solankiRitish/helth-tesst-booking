import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Date and time pickers
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to pick a time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
        backgroundColor: const Color.fromARGB(255, 89, 255, 67), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // Name Input
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Email Input
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Your Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Phone Input
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Your Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Test Name Input
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Enter Test Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Date Picker
            ListTile(
              title: Text(
                _selectedDate == null
                    ? "Select Appointment Date"
                    : DateFormat.yMMMd().format(_selectedDate!),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 20),

            // Time Picker
            ListTile(
              title: Text(
                _selectedTime == null
                    ? "Select Appointment Time"
                    : _selectedTime!.format(context),
              ),
              trailing: const Icon(Icons.access_time),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(height: 20),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _selectedDate == null ||
                    _selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all the fields')),
                  );
                } else {
                  // Booking logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Appointment Confirmed')),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text("Confirm Appointment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 89, 255, 67),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
