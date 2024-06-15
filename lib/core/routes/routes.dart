import 'package:flutter/material.dart';
import 'package:interview/core/routes/screen_names.dart';
import 'package:interview/features/authentication/presentation/screen/otp.dart';
import 'package:interview/features/authentication/presentation/screen/phone.dart';
import 'package:interview/features/main/presentation/screen/home_screen.dart';
Map<String, Widget Function(BuildContext)> routes ={
 ScreenNames.homeScreen:(context)=>   const HomeScreen(),
 ScreenNames.root:(context)=>   PhoneScreen(),
 ScreenNames.otpScreen:(context)=>   OtpScreen(),
};