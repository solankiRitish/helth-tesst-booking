import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: const Color.fromARGB(255, 89, 255, 67),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Health Test Booking!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Our mission is to provide a seamless and efficient way for individuals to book health tests and access top-quality laboratories. We believe that everyone deserves easy access to health services, and we are committed to making that a reality.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Vision:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "To empower individuals to take control of their health by providing accessible and reliable health testing services.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Our Services Include:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "- Easy booking of health tests\n"
              "- Access to top laboratories\n"
              "- User-friendly interface for seamless navigation\n"
              "- Reliable and timely results",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Contact Us:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Email: rsolanki022@rku.ac.in\n"
              "Phone: +91 63546 11600\n"
              "Address: RkU",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Thank you for choosing Health Test Booking. We look forward to serving you!",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
