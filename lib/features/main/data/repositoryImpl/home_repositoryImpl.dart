import 'package:dio/dio.dart';
import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/features/main/data/data_source/main_Api_provider.dart';
import 'package:interview/features/main/data/model/home_model.dart';
import 'package:interview/features/main/domain/entity/home_entity.dart';
import 'package:interview/features/main/domain/repository/home_Repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepositoryImpl extends HomeRepository{
  MainApiProvider apiProvider;
  HomeRepositoryImpl({required this.apiProvider});
  @override
  Future<DataState<HomeEntity>> fetchHomeData(Map<String, dynamic> map) async{
    try {
      Response response = await apiProvider.homeData(map);
      
      if (response.data["data"]["reason"]=="session expired or not valid") {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        return const DataFailed("expired");
      }
      HomeEntity phoneEntity=HomeModel.fromJson(response.data);
      return DataSuccess(phoneEntity);    
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

}