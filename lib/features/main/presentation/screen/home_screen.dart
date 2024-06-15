import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interview/config/styles/text_styles.dart';
import 'package:interview/core/utils/app_colors.dart';
import 'package:interview/features/main/presentation/bloc/home_bloc.dart';
import 'package:interview/locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => locator<HomeBloc>()..add(LoadHomeEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.appBar,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "HomeScreen",
              style: AppTextStyle.appBarTitleTextStyle,
            ),
          ),
        ),
        body: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const SpinKitThreeBounce(
                  color: AppColors.mainButton,
                  size: 25,
                );
              } else if (state is HomeCompleted) {
                return Text(
                  state.homeEntity.data!.secret!,
                  style: AppTextStyle.mainTitleTextStyle,
                );
              } else if (state is HomeError) {
                return const Text(
                  "لطفا بعدا تلاش کنید",
                  style: AppTextStyle.subTitleTextStyle,
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
