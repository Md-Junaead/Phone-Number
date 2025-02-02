import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone/phone_number_bloc.dart';
import 'package:phone/phone_number_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PhoneNumberBloc(),
        child: PhoneNumberScreen(),
      ),
    );
  }
}
