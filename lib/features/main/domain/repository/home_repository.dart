import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/features/main/domain/entity/home_entity.dart';

abstract class HomeRepository{
  Future<DataState<HomeEntity>> fetchHomeData(Map<String,dynamic> map);
 }