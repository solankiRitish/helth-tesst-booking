import 'package:flutter/material.dart';

class EditLabDialog extends StatefulWidget {
  final String initialLabName;
  final String initialAddress;
  final String initialTimings;
  final String initialSpeciality; // New field
  final String initialFees; // New field
  final Function(String, String, String, String, String) onUpdate;

  EditLabDialog({
    required this.initialLabName,
    required this.initialAddress,
    required this.initialTimings,
    required this.initialSpeciality,
    required this.initialFees,
    required this.onUpdate,
  });

  @override
  _EditLabDialogState createState() => _EditLabDialogState();
}

class _EditLabDialogState extends State<EditLabDialog> {
  late TextEditingController _labNameController;
  late TextEditingController _addressController;
  late TextEditingController _timingsController;
  late TextEditingController _specialityController; // New controller
  late TextEditingController _feesController; // New controller

  @override
  void initState() {
    super.initState();
    _labNameController = TextEditingController(text: widget.initialLabName);
    _addressController = TextEditingController(text: widget.initialAddress);
    _timingsController = TextEditingController(text: widget.initialTimings);
    _specialityController = TextEditingController(text: widget.initialSpeciality);
    _feesController = TextEditingController(text: widget.initialFees);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Lab Details'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Round Image placeholder with a pencil icon
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
                      Icons.account_circle, // Default user or image icon
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.edit, // Pencil icon for editing
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
              decoration: InputDecoration(labelText: 'Speciality'), // New field
            ),
            // Fees Field
            TextField(
              controller: _feesController,
              decoration: InputDecoration(labelText: 'Fees'), // New field
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onUpdate(
              _labNameController.text,
              _addressController.text,
              _timingsController.text,
              _specialityController.text,
              _feesController.text,
            );
            Navigator.of(context).pop();
          },
          child: Text('Update'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _labNameController.dispose();
    _addressController.dispose();
    _timingsController.dispose();
    _specialityController.dispose();
    _feesController.dispose();
    super.dispose();
  }
}
