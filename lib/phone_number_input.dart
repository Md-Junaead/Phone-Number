import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone/phone_number_bloc.dart';

class PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // Dispatch the event to update the state with the new phone number
        context
            .read<PhoneNumberBloc>()
            .add(PhoneNumberEvent(number.phoneNumber ?? ''));
      },
      initialValue: PhoneNumber(isoCode: 'US'),
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        showFlags: true,
      ),
      formatInput: true,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
    );
  }
}
