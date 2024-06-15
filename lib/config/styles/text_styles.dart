import 'package:flutter/material.dart';
import 'package:interview/core/utils/app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle mainTitleTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 20,
      color: AppColors.mainTitle,
      fontWeight: FontWeight.w500);

  static const TextStyle subTitleTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.subTitle,
      fontWeight: FontWeight.w300);
      
  static const TextStyle phoneTitleTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 16,
      color: AppColors.phoneTitle,
      fontWeight: FontWeight.w500);
      
  static const TextStyle phoneNumberTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.phoneNumber,
      fontWeight: FontWeight.w400);
      
  static const TextStyle buttonTitleTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 16,
      color: AppColors.buttonTitle,
      fontWeight: FontWeight.w400);
      
  static const TextStyle appBarTitleTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 18,
      color: AppColors.buttonTitle,
      fontWeight: FontWeight.w500);
      
  static const TextStyle wrongPhoneNumberTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.error,
      fontWeight: FontWeight.w400);
      
  static const TextStyle wrongPhoneNumberHelperTextTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      color: AppColors.error,
      fontWeight: FontWeight.w300);
      
  static const TextStyle timerTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.timer,
      fontWeight: FontWeight.w400);
      
  static const TextStyle resendTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.resend,
      fontWeight: FontWeight.w400);
      
  static const TextStyle correctOtpCodeTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.correctCode,
      fontWeight: FontWeight.w400);
      
  static const TextStyle wrongOtpCodeHelperTextTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      color: AppColors.error,
      fontWeight: FontWeight.w400);
      
  static const TextStyle wrongOtpCodeTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.error,
      fontWeight: FontWeight.w400);
      
  static const TextStyle otpCodeTextStyle = TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      color: AppColors.otpCode,
      fontWeight: FontWeight.w400);
   
}
