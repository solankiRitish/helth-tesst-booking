import 'package:flutter/material.dart';

class AllServicesPage extends StatelessWidget {
  final List<Service> services = [
    Service(title: "Arthritis Profile", description: "Comprehensive test for arthritis", icon: Icons.medical_services),
    Service(title: "Diabetic Profile", description: "Tests for blood sugar levels", icon: Icons.bloodtype),
    Service(title: "Lipid Profile", description: "Cholesterol and lipid levels test", icon: Icons.health_and_safety),
    Service(title: "Thyroid Profile", description: "Thyroid function assessment", icon: Icons.thermostat),
    Service(title: "Liver Function Test", description: "Comprehensive liver function test", icon: Icons.local_hospital),
    Service(title: "Kidney Function Test", description: "Tests to check kidney health", icon: Icons.local_pharmacy),
    Service(title: "Complete Blood Count", description: "Detailed blood count test", icon: Icons.opacity),
    // Add more services as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 255, 67),
        title: Text(
          "All Services",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceTile(service: service);
        },
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final IconData icon;

  Service({required this.title, required this.description, required this.icon});
}

class ServiceTile extends StatelessWidget {
  final Service service;

  const ServiceTile({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 89, 255, 67),
          child: Icon(service.icon, color: Colors.white),
        ),
        title: Text(
          service.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(service.description),
        trailing: ElevatedButton(
          onPressed: () {
            // Booking logic or navigate to detailed service page
          },
          child: Text("View"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 89, 255, 67),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
