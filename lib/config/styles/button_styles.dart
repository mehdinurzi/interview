
import 'package:flutter/material.dart';
import 'package:interview/core/utils/app_colors.dart';


abstract class AppButtonStyles {
  static ButtonStyle activeMainButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.mainButton) ,
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8))));

}
