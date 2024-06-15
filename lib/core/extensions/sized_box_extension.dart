import 'package:flutter/material.dart';
import 'package:interview/core/extensions/dimens_extension.dart';


extension SizedBoxExtention on num {
  SizedBox sizedBoxHeight(BuildContext context){
    return SizedBox(height: toDouble().getHeight(context),);
  }
  SizedBox sizedBoxWidth(BuildContext context){
    return SizedBox(width: toDouble().getWidth(context),);
  }
}
