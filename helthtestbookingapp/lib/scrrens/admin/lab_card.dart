import 'package:flutter/material.dart';
import 'package:helthtestbookingapp/scrrens/admin/OfferDialog.dart';
import 'package:helthtestbookingapp/scrrens/admin/edit_lab_dialog.dart';

class LabCard extends StatelessWidget {
  final String labName;
  final String address;
  final String timings;
  final String speciality; // New field
  final String fees; // New field
  final Function(
    String,
    String,
    String,
    String,
    String,
  ) onUpdate; // Update function with new fields
  final Function onDelete; // Callback for delete action

  LabCard({
    required this.labName,
    required this.address,
    required this.timings,
    required this.speciality,
    required this.fees,
    required this.onUpdate,
    required this.onDelete, // Delete callback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                labName[0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 16.0),
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
                  Text("Speciality: $speciality"),
                  Text("Fees: $fees"),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.local_offer, color: Colors.orange),
                  onPressed: () {
                    // Show the offer dialog
                    _showOfferDialog(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Show the edit dialog
                    _showEditLabDialog(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Call delete action
                    onDelete();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show the offer dialog
  void _showOfferDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OfferDialog(
          onOfferAdded: (String offerDetails) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Offer added: $offerDetails")),
            );
          },
        );
      },
    );
  }

  // Show the edit dialog
  void _showEditLabDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditLabDialog(
          initialLabName: labName,
          initialAddress: address,
          initialTimings: timings,
          initialSpeciality: speciality, // Pass new fields
          initialFees: fees, // Pass new fields
          onUpdate: (
            String updatedLabName,
            String updatedAddress,
            String updatedTimings,
            String updatedSpeciality,
            String updatedFees,
          ) {
            // Handle the update
            onUpdate(
              updatedLabName,
              updatedAddress,
              updatedTimings,
              updatedSpeciality,
              updatedFees,
            );
          },
        );
      },
    );
  }
}
