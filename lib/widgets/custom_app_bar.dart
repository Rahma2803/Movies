import 'package:flutter/material.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  String ? text;
  CustomAppBar({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
       title: Text(text!,style: AppStyles.robotoRegular14Yellow, ),
       centerTitle: true,
       backgroundColor: AppColors.transparent,
       leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: AppColors.yellow,),
       ),
    );
  }
  
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}