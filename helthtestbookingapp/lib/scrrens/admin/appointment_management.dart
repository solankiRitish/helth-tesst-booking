import 'package:flutter/material.dart';

class AppointmentManagementScreen extends StatelessWidget {
  // A sample list of appointments including lab information
  final List<Map<String, String>> appointments = [
    {
      'time': '10:00 AM',
      'patient': 'Nishant',
      'status': 'Pending', // Status remains as 'Pending'
      'labName': 'Lab 1',
      'labLocation': 'Ahmedabad, Gujarat'
    },
    {
      'time': '11:00 AM',
      'patient': 'Ritish',
      'status': 'Pending', // Status remains as 'Pending'
      'labName': 'Lab 2',
      'labLocation': 'Rajkot, Gujarat'
    },
    {
      'time': '01:00 PM',
      'patient': 'Harsh',
      'status': 'Completed',
      'labName': 'Lab 3',
      'labLocation': 'Surat, Gujarat'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointments',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: Colors.green,
                      ),
                      title: Text(
                        appointment['time'] ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Patient: ${appointment['patient']}'),
                          SizedBox(height: 4),
                          Text(
                            'Lab: ${appointment['labName']} - ${appointment['labLocation']}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Status: ${appointment['status']}', // Displaying status
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _getStatusColor(appointment['status']),
                            ),
                          ),
                        ],
                      ),
                      trailing: appointment['status'] == 'Pending'
                          ? ElevatedButton(
                              onPressed: () {
                                _showConfirmationDialog(context, appointment);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 51, 255, 58), 
                              ),
                              child: Text('Complete'),
                            )
                          : SizedBox(), 
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to assign colors based on appointment status
  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Pending':
        return const Color.fromARGB(255, 255, 213, 0);
      case 'Completed':
        return Colors.blue;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  // Method to show confirmation dialog
  void _showConfirmationDialog(BuildContext context, Map<String, String> appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Complete Appointment'),
          content: Text('Are you sure the appointment of ${appointment['patient']} is completed ?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                // Code to mark appointment as completed
                // You can update the appointment status in your data model here
                Navigator.of(context).pop(); // Close the dialog
                // Show a success message or update the UI accordingly
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Appointment for ${appointment['patient']} marked as completed.')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
