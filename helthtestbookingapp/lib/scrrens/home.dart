import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/AllServices.dart';
import 'package:helthtestbookingapp/scrrens/All_Labes.dart';
import 'package:helthtestbookingapp/scrrens/ContactUS.dart';
import 'package:helthtestbookingapp/scrrens/My_Boonking.dart';
import 'package:helthtestbookingapp/scrrens/aboutUS.dart';
import 'package:helthtestbookingapp/scrrens/book.dart';
import 'package:helthtestbookingapp/scrrens/bottom_nav_bar.dart';
import 'top_bar.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // For BottomBar navigation

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: "Health Test Booking"), // Use custom TopBar
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Profile Section
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/pro1.jpeg'), // Profile image asset
                radius: 25,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  "Hello Nishant!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search services',
                icon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Services Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllServicesPage()),
                  );
                },
                child: Text("See all >"),
              ),
            ],
          ),
          SizedBox(height: 10),

          // Service Cards Grid
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              ServiceCard(title: "Arthritis Profile"),
              ServiceCard(title: "Diabetic Profile"),
              ServiceCard(title: "Lipid Profile"),
              ServiceCard(title: "Arthritis Profile"),
              ServiceCard(title: "Diabetic Profile"),
              ServiceCard(title: "Lipid Profile"),
            ],
          ),
          SizedBox(height: 20),

          // Top Labs Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Labs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllLabsPage()),
                  );
                },
                child: Text("See all >"),
              ),
            ],
          ),
          SizedBox(height: 10),

          // Lab Tiles with Contact Number
          LabTile(
            labName: "Lab 1",
            address: "Ahmedabad, Gujarat",
            timings: "9:00 AM - 8:00 PM",
            contact: "9123456789",
          ),
          LabTile(
            labName: "Lab 2",
            address: "Surat, Gujarat",
            timings: "10:00 AM - 8:00 PM",
            contact: "9876543210",
          ),
          LabTile(
            labName: "Lab 3",
            address: "Rajkot, Gujarat",
            timings: "10:00 AM - 8:00 PM",
            contact: "9876543210",
          ),
        ],
      ),

      // Custom Bottom Navigation Bar
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

      // Drawer for menu options
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
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;

  const ServiceCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 89, 255, 67),
        borderRadius: BorderRadius.circular(20),
        
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.health_and_safety_outlined, size: 40), 
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class LabTile extends StatelessWidget {
  final String labName;
  final String address;
  final String timings;
  final String contact; 

  const LabTile({
    required this.labName,
    required this.address,
    required this.timings,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 89, 255, 67),
              child: Text(labName[0], style: TextStyle(fontSize: 18)),
              radius: 25,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Address: $address"),
                  Text("Timings: $timings"),
                  Text("Contact: $contact"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookAppointmentPage()),
                );
              },
              child: Text("Book Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 89, 255, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
