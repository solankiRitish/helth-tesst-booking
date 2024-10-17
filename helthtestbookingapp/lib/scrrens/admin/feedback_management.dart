import 'package:flutter/material.dart';

class FeedbackManagementScreen extends StatelessWidget {
  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Management"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildFeedbackCard(
            userName: "John Doe",
            feedback: "Great service, I really enjoyed my visit!",
            date: "2024-09-01",
          ),
          _buildFeedbackCard(
            userName: "Jane Smith",
            feedback: "The lab was clean and staff were friendly.",
            date: "2024-09-02",
          ),
          _buildFeedbackCard(
            userName: "Alice Johnson",
            feedback: "I faced a long wait time but overall a good experience.",
            date: "2024-09-03",
          ),
          _buildFeedbackCard(
            userName: "Bob Brown",
            feedback: "Feedback on test results was prompt and clear.",
            date: "2024-09-04",
          ),
        ],
      ),
    );
  }

  // Function to build each feedback card
  Widget _buildFeedbackCard({required String userName, required String feedback, required String date}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Name
            Text(
              userName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            // Feedback Content
            Text(feedback),
            SizedBox(height: 4.0),
            // Feedback Date
            Text(
              date,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 8.0),
            // Edit and Delete Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Delete functionality
                    ScaffoldMessenger.of(context!).showSnackBar(
                      SnackBar(content: Text("Delete functionality to be implemented")),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
