import 'package:bloc/bloc.dart';
import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/features/authentication/domain/entity/otp_entity.dart';
import 'package:interview/features/authentication/domain/usecase/otp_usecase.dart';
import 'package:interview/features/authentication/domain/usecase/phone_Auth_usecase.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:equatable/equatable.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  OtpUsecase otpUsecase;
  PhoneAuthUsecase phoneAuthUsecase;
  AuthenticationBloc({required this.otpUsecase, required this.phoneAuthUsecase})
      : super(AuthInitial()) {
        

    on<PhoneAuthEvent>((event, emit) async {
      bool isPhoneCorrect = event.phoneNumber.isValidIranianMobileNumber();
      if (isPhoneCorrect) {
        emit(PhoneLoading());
        Map<String, dynamic> map = {
          "function": "request_login_mobile_interview",
          "params": {"mobile": event.phoneNumber.substring(1)}
        };

        DataState dataState = await phoneAuthUsecase(map);
        if (dataState is DataSuccess) {
          emit( PhoneCompleted());
        }
        if (dataState is DataFailed) {
          emit(PhoneError(dataState.error.toString()));
        }
      } else {
        emit(PhoneError(""));
      }
    });

    on<OtpEvent>((event, emit) async {
      emit(OtpLoading());
      Map<String, dynamic> map = {
        "function": "approve_login_mobile_interview",
        "params": {
          "mobile": event.phoneValue.substring(1),
          "otp": event.otpValue
        }
      };
      DataState dataState = await otpUsecase(map);
      if (dataState is DataSuccess) {
        emit(OtpCompleted(dataState.data));        
      }
      if (dataState is DataFailed) {
        emit(OtpError(dataState.error.toString()));
      }
    });
  }
}
