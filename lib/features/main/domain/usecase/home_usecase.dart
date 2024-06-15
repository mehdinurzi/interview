import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/core/usecase/use_case.dart';
import 'package:interview/features/main/domain/entity/home_entity.dart';
import 'package:interview/features/main/domain/repository/home_Repository.dart';

class HomeUsecase extends UseCase<DataState<HomeEntity>,Map<String,dynamic>>{
  HomeRepository homeRepository;
  HomeUsecase({required this.homeRepository});
  @override
  Future<DataState<HomeEntity>> call(Map<String, dynamic> map) {
    return homeRepository.fetchHomeData(map);
  }
}