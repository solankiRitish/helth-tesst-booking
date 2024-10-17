import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/ContactUS.dart';
import 'package:helthtestbookingapp/scrrens/My_Boonking.dart';
import 'package:helthtestbookingapp/scrrens/User_editProfile.dart';
import 'package:helthtestbookingapp/scrrens/aboutUS.dart';
import 'package:helthtestbookingapp/scrrens/bottom_nav_bar.dart';
import 'package:helthtestbookingapp/scrrens/home.dart';
import 'package:helthtestbookingapp/scrrens/phone.dart';
import 'package:helthtestbookingapp/scrrens/user_changePassword.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 255, 67),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Profile image
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/images/doctor1.jpg'), // Ensure this path is correct
                    ),
                    SizedBox(width: 20),
                    // Profile Name and Phone Number
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nishant Patel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '+91 92655 40068',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Menu Options List
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                      Icons.edit, 'Edit Profile', context), // Edit Profile
                  _buildListTile(Icons.lock, 'Change Password',
                      context), // New Change Password option
                  _buildListTile(Icons.logout, 'LogOut',
                      context), // LogOut with confirmation dialog
                ],
              ),
            ),
          ],
        ),
      ),

      // Use the imported BottomBar widget
      bottomNavigationBar: BottomBar(
        currentIndex: 3,
        onTap: (index) {
          // Handle the tab selection here
        },
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      onTap: () {
        // Handle navigation based on title
        if (title == 'Edit Profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditProfilePage()),
          );
        } else if (title == 'Change Password') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChangePasswordPage()), 
          );
        } else if (title == 'LogOut') {
          _showLogoutConfirmationDialog(
              context); 
        }
      },
    );
  }

  // Function to show logout confirmation dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm LogOut'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('LogOut'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhoneVerificationScreen()),
                );
                print("User Logged Out");
              },
            ),
          ],
        );
      },
    );
  }
}
