import 'package:flutter/material.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.yellow,
            foregroundColor: AppColors.black,
            side: const BorderSide(
              width: 1, 
              color: Colors.black, 
            ),
            padding: EdgeInsets.symmetric(vertical: context.h*0.04),
          ),
          onPressed: () {
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text("LogIn",style: AppStyles.robotoRegular20,),
                SizedBox(width: context.w*0.01,),
                Icon(Icons.login,color: AppColors.white,)
            ],
          ),
        ),
      ],
    );
  }
}