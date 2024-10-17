import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:helthtestbookingapp/scrrens/singeIn.dart';
import 'package:helthtestbookingapp/scrrens/singeup.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;
  bool _isValidNumber = false;
  String _localPhoneNumber = '';
  String _countryCode = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // Simulating a function to check if the mobile number is already registered
  Future<bool> isNumberRegistered(String phoneNumber) async {
    await Future.delayed(Duration(seconds: 2));
    return phoneNumber == '1234567890';
  }

  void validatePhoneNumber(String localNumber) {
    String digitsOnly = localNumber.replaceAll(RegExp(r'\D'), '');
    int requiredDigits = 10;

    setState(() {
      _isValidNumber = digitsOnly.length == requiredDigits;
      _localPhoneNumber = digitsOnly;
    });

    print('Local phone number: $localNumber');
    print('Digits only: $digitsOnly');
    print('Is valid: $_isValidNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // To prevent overflow when keyboard appears
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/phone.jpg',
              fit: BoxFit.contain,
              height: 200,
            ),
            SizedBox(height: 30),
            Text(
              'Phone Verification',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'We need to register your phone before getting started!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Phone Number Input with Country Code and Flags
            Row(
              children: [
                Expanded(
                  child: IntlPhoneField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    initialCountryCode: 'IN', // Set default country code to India
                    onChanged: (phone) {
                      _countryCode = phone.countryCode; // e.g., '93'
                      validatePhoneNumber(phone.number);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ${country.name}, Code: ${country.code}');
                    },
                  ),
                ),
                SizedBox(width: 10),
                // Show icon based on validation
                if (_phoneController.text.isNotEmpty)
                  Icon(
                    _isValidNumber ? Icons.check_circle : Icons.error,
                    color: _isValidNumber ? Colors.green : Colors.red,
                    size: 30,
                  ),
              ],
            ),
            SizedBox(height: 20),

            // Register Button
            ElevatedButton(
              onPressed: _isValidNumber
                  ? () async {
                      setState(() {
                        _isLoading = true;
                      });

                      // Combine country code and local number if needed
                      String fullPhoneNumber = '$_countryCode$_localPhoneNumber';

                      // Check if phone number is already registered
                      bool isRegistered = await isNumberRegistered(_localPhoneNumber);

                      setState(() {
                        _isLoading = false;
                      });

                      if (isRegistered) {
                        // If number is already registered, navigate to SignInPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      } else {
                        // If number is not registered, navigate to SignUpPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      }
                    }
                  : null, // Disable button if number is invalid
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
