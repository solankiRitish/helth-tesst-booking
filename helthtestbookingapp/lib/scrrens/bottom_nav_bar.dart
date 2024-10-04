import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/My_Boonking.dart';
import 'package:helthtestbookingapp/scrrens/UserProfile.dart';
import 'package:helthtestbookingapp/scrrens/home.dart';
import 'package:helthtestbookingapp/scrrens/offresPage.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex; // Current index parameter to track the selected tab
  final Function(int) onTap; // Function to handle tab selection

  BottomBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Pass the currentIndex
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingsPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OffersPage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            break;
        }
      },
      selectedItemColor: Colors.greenAccent[400],
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Bookings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.percent),
          label: "Offers",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}


