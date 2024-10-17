import 'package:flutter/material.dart';

class AddAdminScreen extends StatefulWidget {
  @override
  _AddAdminScreenState createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
  final TextEditingController adminNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _addAdmin() {
    final adminName = adminNameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (adminName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Admin "$adminName" added successfully!')),
      );

      // Clear the input fields after adding the admin
      adminNameController.clear();
      emailController.clear();
      passwordController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the top-left
          children: [
            Text(
              'Add Admin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: adminNameController,
              decoration: InputDecoration(labelText: 'Admin Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
             TextField(
              controller: adminNameController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Center( // Center the button
              child: ElevatedButton(
                onPressed: _addAdmin,
                child: Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 76, 251, 82), // Button color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    adminNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
