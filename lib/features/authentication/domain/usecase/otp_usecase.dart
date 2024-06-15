import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/core/usecase/use_case.dart';
import 'package:interview/features/authentication/domain/entity/otp_entity.dart';
import 'package:interview/features/authentication/domain/repository/auth_repository.dart';

class OtpUsecase extends UseCase<DataState<OtpEntity>,Map<String,dynamic>>{
  AuthRepository authRepository;
  OtpUsecase({required this.authRepository});
  
  @override
  Future<DataState<OtpEntity>> call(Map<String, dynamic> map) {
    return authRepository.fetchOtpData(map);
  }
  
}