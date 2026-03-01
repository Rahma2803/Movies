import 'package:flutter/material.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/widgets/custom_text_field.dart';
import 'package:movies/widgets/custome_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text("Forget Password" ,style: AppStyles.poppinsRegular16Yellow,),
        centerTitle:true,
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(
          color: AppColors.yellow
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.w*0.037
        ),
        child: Column(
          spacing: 0.025*context.h,
          children: [
            Image.asset(AppAssets.forgotPassword),
            CustomTextField(
              prefix: Icon(Icons.email_rounded , color: AppColors.white),
                text: "Email"
            ),
            CustomeButton(
                text: "Verify Email",
                onPressed: (){

                },
                backgroundColor: AppColors.yellow,
                foregroundColor: AppColors.black,
                borderColor: AppColors.yellow,
                textStyle: AppStyles.interRegular20Black,
              isMax: true,

            ),
          ],
        ),
      ),
    );
  }
}