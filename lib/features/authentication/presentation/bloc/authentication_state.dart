part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthenticationState{}

class PhoneLoading extends AuthenticationState{}

class PhoneCompleted extends AuthenticationState{}

class PhoneError extends AuthenticationState{
  final String message;
  PhoneError(this.message);
} 


class OtpLoading extends AuthenticationState{}

class OtpCompleted extends AuthenticationState{
  final OtpEntity otpEntity;
  OtpCompleted(this.otpEntity);
}

class OtpError extends AuthenticationState{
  final String message;
  OtpError(this.message);
}