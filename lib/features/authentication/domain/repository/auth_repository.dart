import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/features/authentication/domain/entity/otp_entity.dart';
import 'package:interview/features/authentication/domain/entity/phone_entity.dart';

abstract class AuthRepository{
  Future<DataState<PhoneEntity>> fetchPhoneAuthData(Map<String,dynamic> map);
  Future<DataState<OtpEntity>> fetchOtpData(Map<String,dynamic> map);
}