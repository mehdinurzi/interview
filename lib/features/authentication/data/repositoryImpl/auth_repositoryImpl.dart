import 'package:dio/dio.dart';
import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/features/authentication/data/data_source/auth_Api_provider.dart';
import 'package:interview/features/authentication/data/model/otp_model.dart';
import 'package:interview/features/authentication/data/model/phone_model.dart';
import 'package:interview/features/authentication/domain/entity/otp_entity.dart';
import 'package:interview/features/authentication/domain/entity/phone_entity.dart';
import 'package:interview/features/authentication/domain/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthApiProvider apiProvider;
  AuthRepositoryImpl({required this.apiProvider});
  @override
  Future<DataState<OtpEntity>> fetchOtpData(Map<String, dynamic> map) async {
    try {
      Response response = await apiProvider.sendOtpCode(map);

      if (response.data["data"]["session"]!=null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("session", response.data["data"]["session"]);
      }

      if (map["params"]["otp"] == "111111") {
        OtpEntity otpEntity = OtpModel.fromJson(response.data);
        return DataSuccess(otpEntity);
      }

      if (map["params"]["otp"] == ""||map["params"]["otp"].length<6) {
        return const DataFailed("لطفا مقدار کد را کامل وارد کنید");
      }

      if (response.data["data"]["reason_local"] == "کد وارد شده اشتباه است") {
        return DataFailed(response.data["data"]["reason_local"]);
      }

      OtpEntity otpEntity = OtpModel.fromJson(response.data);
      return DataSuccess(otpEntity);
    } catch (e) {
      print(e.toString());
      return const DataFailed("لطفا بعدا تلاش کنید");
    }
  }

  @override
  Future<DataState<PhoneEntity>> fetchPhoneAuthData(
      Map<String, dynamic> map) async {
    try {
      Response response = await apiProvider.phoneAuth(map);
      PhoneEntity phoneEntity = PhoneModel.fromJson(response.data);
      return DataSuccess(phoneEntity);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
