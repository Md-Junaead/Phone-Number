import 'package:flutter_bloc/flutter_bloc.dart';

// State class for managing the phone number input state
class PhoneNumberState {
  final String phoneNumber;

  PhoneNumberState({this.phoneNumber = ''});
}

// Event class for updating the phone number
class PhoneNumberEvent {
  final String phoneNumber;

  PhoneNumberEvent(this.phoneNumber);
}

// BLoC to manage the phone number state
class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneNumberState> {
  PhoneNumberBloc() : super(PhoneNumberState());

  @override
  Stream<PhoneNumberState> mapEventToState(PhoneNumberEvent event) async* {
    yield PhoneNumberState(phoneNumber: event.phoneNumber);
  }
}
