import 'package:flutter/material.dart';

class OfferDialog extends StatefulWidget {
  final Function(String) onOfferAdded; // Callback to handle offer submission

  OfferDialog({required this.onOfferAdded});

  @override
  _OfferDialogState createState() => _OfferDialogState();
}

class _OfferDialogState extends State<OfferDialog> {
  final TextEditingController _offerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Offer'),
      content: TextField(
        controller: _offerController,
        decoration: InputDecoration(
          hintText: 'Enter offer',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Send offer details back
            widget.onOfferAdded(_offerController.text);
            Navigator.of(context).pop(); // Close the dialog after submitting
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _offerController.dispose(); // Dispose the controller when the dialog is closed
    super.dispose();
  }
}
