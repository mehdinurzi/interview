part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class PhoneAuthEvent extends AuthenticationEvent{
  final String phoneNumber;
  PhoneAuthEvent(this.phoneNumber);
}

class OtpEvent extends AuthenticationEvent{
  String otpValue;
  String phoneValue;
  OtpEvent(this.otpValue,this.phoneValue);
}


