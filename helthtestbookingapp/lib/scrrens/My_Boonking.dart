import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/ContactUS.dart';
import 'package:helthtestbookingapp/scrrens/aboutUS.dart';
import 'package:helthtestbookingapp/scrrens/bottom_nav_bar.dart';
import 'package:helthtestbookingapp/scrrens/home.dart';
import 'top_bar.dart';

class BookingsPage extends StatefulWidget {
  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  int _currentIndex = 1; // Track the selected tab

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Test Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: BookingPage(
        currentIndex: _currentIndex, // Pass the current index
        onTabTapped: _onTabTapped, // Pass the tap handler
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  BookingPage({required this.currentIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: 'Bookings'), // Use the imported TopBar widget

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 89, 255, 67),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('My Bookings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAppointmentCard(context),
          ],
        ),
      ),

      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lab Name:',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              'labe 1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Lab Speciality:',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'All Test',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Preferred Pathologist:',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Solanki',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Appointment Date : ',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text('30/11/2023',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text('Appointment Time :',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text('2:00 PM',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // Image with rounded corners
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Set radius
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Set the same radius
                    child: Image.asset(
                      'assets/images/doctor4.jpg',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Status : ',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Pending',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 89, 255, 67),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    _showReviewDialog(context); // Show the review dialog
                  },
                  child: Text('Done'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 89, 255, 67),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    _showRescheduleDialog(context);
                  },
                  child: Text('Reschedule'),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the Review dialog
  void _showReviewDialog(BuildContext context) {
    TextEditingController _reviewController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submit Feedback'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _reviewController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Enter your Feedback',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without saving
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String review = _reviewController.text;
                if (review.isNotEmpty) {
                  // You can process the review here, like saving it to the database
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Feedback submitted: $review')),
                  );
                }
                Navigator.of(context).pop(); // Close dialog after saving
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showRescheduleDialog(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        // Now you have both date and time selected.
        // You can store or process the selected date and time here.

        // Optionally, show a confirmation or success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Appointment rescheduled to ${selectedDate.toLocal()} at ${selectedTime.format(context)}'),
          ),
        );
      }
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this appointment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without deleting
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle the deletion process here
                Navigator.of(context).pop(); // Close dialog after deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Appointment deleted')),
                );
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
