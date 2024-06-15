import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interview/config/styles/button_styles.dart';
import 'package:interview/config/styles/text_styles.dart';
import 'package:interview/core/extensions/dimens_extension.dart';
import 'package:interview/core/utils/app_colors.dart';
import 'package:interview/core/utils/app_strings.dart';

class AppButton extends StatelessWidget {
  final Function()onTap;
  final bool isLoading;
  const AppButton({
    required this.onTap,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 43.getHeight(context),
      child: ElevatedButton(
        style: AppButtonStyles.activeMainButton,
        onPressed: onTap,
        child:isLoading?const SpinKitThreeBounce(color: AppColors.buttonTitle,size: 15,) : const Text(AppStrings.loginButton,style: AppTextStyle.buttonTitleTextStyle,),
      ),
    );
  }
}