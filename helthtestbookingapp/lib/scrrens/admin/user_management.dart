import 'package:flutter/material.dart';

class UserManagementScreen extends StatelessWidget {
  // Sample static list of users
  final List<Map<String, String>> users = [
    {"name": "Ritish", "email": "ritish@gmail.com", "role": "Admin"},
    {"name": "Nishant", "email": "nishant@gmail.com", "role": "User"},
    {"name": "Harsh", "email": "harsh@gmail.com", "role": "User"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Users List',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        user['name']![0], 
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(user['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user['email']!),
                        Text('Role: ${user['role']}'), // Displaying role here
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Code to delete user (future functionality)
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
