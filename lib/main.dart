import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Number Input',
      home: PhoneNumberInputScreen(),
    );
  }
}

class PhoneNumberInputScreen extends StatefulWidget {
  @override
  _PhoneNumberInputScreenState createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends State<PhoneNumberInputScreen> {
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Input'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
            initialCountryCode: 'US', // Initial country code (optional)
            onChanged: (phone) {
              setState(() {
                phoneNumber = phone;
              });
              print(phoneNumber
                  ?.completeNumber); // Print the complete phone number
              print(
                  phoneNumber?.countryCode); // Print the selected country code
              print(phoneNumber
                  ?.number); // Print the phone number without country code
            },
            onCountryChanged: (country) {
              print('Country changed to: ${country.name}');
            },
            // Optional styling
            dropdownDecoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            flagsTextStyle: TextStyle(fontSize: 16),
            // Disable auto-formatting (optional)
            // autoFormat: false,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (phoneNumber != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Phone Number Details'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Complete Number: ${phoneNumber!.completeNumber}'),
                    Text('Country Code: ${phoneNumber!.countryCode}'),
                    Text('Number: ${phoneNumber!.number}'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please enter a phone number')),
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
