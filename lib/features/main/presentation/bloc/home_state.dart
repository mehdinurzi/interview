part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeCompleted extends HomeState {
  final HomeEntity homeEntity;
  const HomeCompleted({required this.homeEntity});
}

final class HomeError extends HomeState {
  final String error;
  const HomeError({required this.error});
}
