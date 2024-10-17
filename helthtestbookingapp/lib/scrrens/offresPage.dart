import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/ContactUS.dart';
import 'package:helthtestbookingapp/scrrens/My_Boonking.dart';
import 'package:helthtestbookingapp/scrrens/aboutUS.dart';
import 'package:helthtestbookingapp/scrrens/bottom_nav_bar.dart';
import 'package:helthtestbookingapp/scrrens/home.dart'; 

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 255, 67),
        title: Text(
          'Offers',
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
            Text(
              "Special Offers",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildOfferCard('Offer1', 'Senior Surgeon', '8:00 AM - 5:00 PM', 'Fees: 1200 rs.', 'assets/images/doctor2.jpg'),
            _buildOfferCard('Offer2', 'Senior Surgeon', '8:00 AM - 5:00 PM', 'Fees: 1200 rs.', 'assets/images/doctor2.jpg'),
            SizedBox(height: 20),
            Text(
              "Daily Offers",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildOfferCard('Offer1', 'Senior Surgeon', '8:00 AM - 5:00 PM', 'Fees: 1200 rs.', 'assets/images/doctor2.jpg'),
          ],
        ),
      ),
      // Use the imported BottomBar widget
      bottomNavigationBar: BottomBar(
        currentIndex: 2, // Set the default index as OffersPage
        onTap: (index) {
          // Handle the tab selection here
        },
      ),
    );
  }

  Widget _buildOfferCard(String offerTitle, String speciality, String time, String fees, String imageUrl) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offerTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    speciality,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    fees,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
