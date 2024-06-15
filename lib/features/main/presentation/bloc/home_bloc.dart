import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview/core/erorr_handling/data_state.dart';
import 'package:interview/features/main/domain/entity/home_entity.dart';
import 'package:interview/features/main/domain/usecase/home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeUsecase homeUsecase;
  HomeBloc({required this.homeUsecase}) : super(HomeInitial()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoading());
      Map<String, dynamic> map = {
        "function": "request_account_information_interview",
        "params": {"method": "short"}
      };
      DataState dataState=await homeUsecase.call(map);
      if (dataState is DataSuccess) {
        emit(HomeCompleted(homeEntity: dataState.data));
      }
      if (dataState is DataFailed) {
        emit(HomeError(error: dataState.error.toString()));
      }
    });
  }
}
