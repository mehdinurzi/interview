
 import 'package:flutter/material.dart';

 extension AppHeightDimens on num{
   double getHeight(BuildContext context){
      var size = MediaQuery.of(context).size.height;
     return size/(932/this);
   }
 }
 
 extension AppWidthDimens on num{
   double getWidth(BuildContext context){
      var size = MediaQuery.of(context).size.width;
     return size/(430/this);
   }
 }