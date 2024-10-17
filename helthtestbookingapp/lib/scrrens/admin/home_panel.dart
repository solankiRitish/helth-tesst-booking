
import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/admin/AddAdminScreen.dart';
import 'package:helthtestbookingapp/scrrens/admin/appointment_management.dart';
import 'package:helthtestbookingapp/scrrens/admin/feedback_management.dart';
import 'package:helthtestbookingapp/scrrens/admin/labManagement.dart';
import 'package:helthtestbookingapp/scrrens/admin/user_management.dart';

void main() {
  runApp(AdminPanel());
}

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
            debugShowCheckedModeBanner: false,
      home: AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    UserManagementScreen(),
    AppointmentManagementScreen(),
    LabManagementScreen(),
    FeedbackManagementScreen(),
    AddAdminScreen(), // New Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        backgroundColor: const Color.fromARGB(255, 76, 251, 82),
      ),
      body: _pages[_selectedIndex], // Display the corresponding page content
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // To allow more than 3 items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Labs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Add Admin', // New Item
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
