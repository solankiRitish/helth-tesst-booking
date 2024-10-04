import 'package:flutter/material.dart';

class AddLabDialog extends StatefulWidget {
  @override
  _AddLabDialogState createState() => _AddLabDialogState();
}

class _AddLabDialogState extends State<AddLabDialog> {
  final TextEditingController _labNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _timingsController = TextEditingController();
  final TextEditingController _specialityController = TextEditingController();
  final TextEditingController _feesController = TextEditingController();

  @override
  void dispose() {
    _labNameController.dispose();
    _addressController.dispose();
    _timingsController.dispose();
    _specialityController.dispose();
    _feesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Lab'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Round Image placeholder with an icon
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Stack(
                  children: [
                    Icon(
                      Icons.account_circle, // A default user or image icon
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.add_a_photo, // Small icon for adding a photo
                        size: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Lab Name Field
            TextField(
              controller: _labNameController,
              decoration: InputDecoration(labelText: 'Lab Name'),
            ),
            // Address Field
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            // Timings Field
            TextField(
              controller: _timingsController,
              decoration: InputDecoration(labelText: 'Timings'),
            ),
            // Speciality Field
            TextField(
              controller: _specialityController,
              decoration: InputDecoration(labelText: 'Speciality'),
            ),
            // Fees Field
            TextField(
              controller: _feesController,
              decoration: InputDecoration(labelText: 'Fees'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Retrieve all field values
            final labName = _labNameController.text.trim();
            final address = _addressController.text.trim();
            final timings = _timingsController.text.trim();
            final speciality = _specialityController.text.trim();
            final fees = _feesController.text.trim();

            // Validate inputs
            if (labName.isNotEmpty &&
                address.isNotEmpty &&
                timings.isNotEmpty &&
                speciality.isNotEmpty &&
                fees.isNotEmpty) {
              // Optionally, you can add more validation for fees (e.g., numeric)
              if (double.tryParse(fees) == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fees must be a valid number.')),
                );
                return;
              }

              // Create a new lab map with all fields
              final newLab = {
                'name': labName,
                'address': address,
                'timings': timings,
                'speciality': speciality,
                'fees': fees,
                'image': 'placeholder', // Placeholder for image data
              };

              Navigator.of(context).pop(newLab); // Return the new lab
            } else {
              // Show error message if any field is empty
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please fill in all fields.')),
              );
            }
          },
          child: Text('Add Lab'),
        ),
      ],
    );
  }
}
