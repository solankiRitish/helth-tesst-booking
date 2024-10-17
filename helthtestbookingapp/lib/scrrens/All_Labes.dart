import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/book.dart';

class AllLabsPage extends StatelessWidget {
  final List<Map<String, String>> labs = [
    {
      "name": "Lab 1",
      "address": "Ahmedabad, Gujarat",
      "timings": "9:00 AM - 8:00 PM",
      "contact": "9876543210"
    },
    {
      "name": "Lab 2",
      "address": "Surat, Gujarat",
      "timings": "10:00 AM - 6:00 PM",
      "contact": "9123456789"
    },
    {
      "name": "Lab 3",
      "address": "Vadodara, Gujarat",
      "timings": "9:00 AM - 7:00 PM",
      "contact": "9845123456"
    },
    {
      "name": "Lab 4",
      "address": "Rajkot, Gujarat",
      "timings": "9:00 AM - 8:00 PM",
      "contact": "9812345678"
    },
    {
      "name": "Lab 5",
      "address": "Bhavnagar, Gujarat",
      "timings": "10:00 AM - 9:00 PM",
      "contact": "9876543210"
    },
    {
      "name": "Lab 6",
      "address": "Gandhinagar, Gujarat",
      "timings": "9:00 AM - 8:00 PM",
      "contact": "9123456789"
    },
    {
      "name": "Lab 7",
      "address": "Jamnagar, Gujarat",
      "timings": "9:00 AM - 6:00 PM",
      "contact": "9845123456"
    },
    {
      "name": "Lab 8",
      "address": "Anand, Gujarat",
      "timings": "10:00 AM - 7:00 PM",
      "contact": "9812345678"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Labs'),
        backgroundColor: const Color.fromARGB(255, 89, 255, 67),
      ),
      body: ListView.builder(
        itemCount: labs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(Icons.local_hospital, color: Colors.white),
                    ),
                    title: Text(labs[index]['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${labs[index]['address']}'),
                        Text('${labs[index]['timings']}'),
                        Text('Contact: ${labs[index]['contact']}'),
                      ],
                    ),
                    onTap: () {
                      // Add logic to navigate to a detailed page for each lab if needed
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Lab: ${labs[index]['name']} selected')),
                      );
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookAppointmentPage()),
                        );
                      },
                      child: Text("Book Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 89, 255, 67),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
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
