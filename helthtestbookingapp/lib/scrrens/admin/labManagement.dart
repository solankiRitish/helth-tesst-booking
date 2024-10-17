import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/admin/addlab.dart';
import 'lab_card.dart';

class LabManagementScreen extends StatefulWidget {
  @override
  _LabManagementScreenState createState() => _LabManagementScreenState();
}

class _LabManagementScreenState extends State<LabManagementScreen> {
  // Updated list of labs with 'speciality' and 'fees'
  List<Map<String, String>> labs = [
    {
      'name': 'Lab 2',
      'address': 'Rohini',
      'timings': '10:00 AM - 8:00 PM',
      'speciality': 'Pathology',
      'fees': '500'
    },
    {
      'name': 'TataMg',
      'address': 'NHPC Chowk, Faridabad',
      'timings': '10:00 AM - 8:00 PM',
      'speciality': 'Radiology',
      'fees': '700'
    },
    {
      'name': 'Dr. Lal PathLabs',
      'address': 'Gurgaon',
      'timings': '9:00 AM - 7:00 PM',
      'speciality': 'General Testing',
      'fees': '600'
    },
    {
      'name': 'Metropolis Healthcare',
      'address': 'Noida',
      'timings': '10:00 AM - 6:00 PM',
      'speciality': 'Advanced Diagnostics',
      'fees': '800'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab Management"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 107, 250, 88),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: () async {
                // Await the result from AddLabDialog
                final newLab = await _showAddLabDialog(context);
                if (newLab != null) {
                  setState(() {
                    labs.add(newLab);
                  });
                }
              },
              child: const Text(
                "Add Lab",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: labs.length,
        itemBuilder: (context, index) {
          final lab = labs[index];
          return LabCard(
            labName: lab['name']!,
            address: lab['address']!,
            timings: lab['timings']!,
            speciality: lab['speciality']!,
            fees: lab['fees']!,
            onUpdate: (
              String updatedLabName,
              String updatedAddress,
              String updatedTimings,
              String updatedSpeciality,
              String updatedFees,
            ) {
              setState(() {
                labs[index] = {
                  'name': updatedLabName,
                  'address': updatedAddress,
                  'timings': updatedTimings,
                  'speciality': updatedSpeciality,
                  'fees': updatedFees,
                };
              });
            },
            onDelete: () {
              _confirmDelete(context, index);
            },
          );
        },
      ),
    );
  }

  // Show the Add Lab Dialog and await the new lab data
  Future<Map<String, String>?> _showAddLabDialog(BuildContext context) {
    return showDialog<Map<String, String>>(
      context: context,
      builder: (BuildContext context) {
        return AddLabDialog();
      },
    );
  }

  // Confirm deletion of a lab
  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Lab'),
          content: Text('Are you sure you want to delete ${labs[index]['name']}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  labs.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Lab deleted successfully")),
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
