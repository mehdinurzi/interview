

import 'package:get_it/get_it.dart';
import 'package:interview/features/authentication/data/data_source/auth_Api_provider.dart';
import 'package:interview/features/authentication/data/repositoryImpl/auth_repositoryImpl.dart';
import 'package:interview/features/authentication/domain/repository/auth_repository.dart';
import 'package:interview/features/authentication/domain/usecase/otp_usecase.dart';
import 'package:interview/features/authentication/domain/usecase/phone_Auth_usecase.dart';
import 'package:interview/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:interview/features/main/data/data_source/main_Api_provider.dart';
import 'package:interview/features/main/data/repositoryImpl/home_repositoryImpl.dart';
import 'package:interview/features/main/domain/repository/home_Repository.dart';
import 'package:interview/features/main/domain/usecase/home_usecase.dart';
import 'package:interview/features/main/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider());
  locator.registerSingleton<MainApiProvider>(MainApiProvider());


  /// repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(apiProvider:locator()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(apiProvider:locator()));

  /// use case
  locator.registerSingleton<OtpUsecase>(OtpUsecase(authRepository: locator()));
  locator.registerSingleton<PhoneAuthUsecase>(PhoneAuthUsecase(authRepository: locator()));
  locator.registerSingleton<HomeUsecase>(HomeUsecase(homeRepository: locator()));

  ///bloc
  locator.registerFactory<AuthenticationBloc>(()=> AuthenticationBloc(otpUsecase: locator(), phoneAuthUsecase: locator()));
  locator.registerFactory<HomeBloc>(()=> HomeBloc(homeUsecase: locator()),);
}