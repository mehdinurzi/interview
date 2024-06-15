import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/core/usecase/use_case.dart';
import 'package:interview/features/authentication/domain/entity/phone_entity.dart';
import 'package:interview/features/authentication/domain/repository/auth_repository.dart';

class PhoneAuthUsecase extends UseCase<DataState<PhoneEntity>,Map<String,dynamic>>{
  AuthRepository authRepository;
  PhoneAuthUsecase({required this.authRepository});
  @override
  Future<DataState<PhoneEntity>> call(Map<String, dynamic> map) {
    return authRepository.fetchPhoneAuthData(map);
  }

}