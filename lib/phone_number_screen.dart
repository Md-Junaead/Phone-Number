import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone/phone_number_bloc.dart';
import 'package:phone/phone_number_input.dart';

class PhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country-Based Phone Number Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Phone Number Input Widget
            PhoneNumberInput(),
            SizedBox(height: 20),
            // Display the current phone number
            BlocBuilder<PhoneNumberBloc, PhoneNumberState>(
              builder: (context, state) {
                return Text(
                  'Entered Phone Number: ${state.phoneNumber}',
                  style: TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
