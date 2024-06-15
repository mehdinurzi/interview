import 'package:flutter/material.dart';
import 'package:interview/core/extensions/dimens_extension.dart';
import 'package:interview/core/utils/app_colors.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{

  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(88.getHeight(context)),
      child: Container(
        height: 88.getHeight(context),
        width: double.infinity,
        color: AppColors.mainButton,
        child: const Center(child: Text("Interview",style: TextStyle(fontFamily: "iransansx",fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),))
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(88);
}