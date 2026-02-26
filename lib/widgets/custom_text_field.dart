
import 'package:flutter/material.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';

class CustomTextField extends StatelessWidget {
  Widget ? prefix;
  Widget ? suffix;
  String text;
  bool obsecureText;
  TextInputType keyBoardType;
  TextEditingController? controller;
  void Function(String?)? onChanging;
  String? Function(String?)? onValidtator;
  CustomTextField({super.key,this.keyBoardType = TextInputType.text,this.obsecureText=false,this.controller,this.onChanging,this.onValidtator,this.prefix,this.suffix,required this.text,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      onChanged: onChanging,
      validator: onValidtator,
      obscureText : obsecureText,
      decoration: InputDecoration( 
        contentPadding: EdgeInsets.symmetric(
          vertical: context.h*0.02,
          horizontal: context.w*0.02
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        filled: true,
        fillColor: AppColors.grey,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: context.w*0.02),
          child: prefix,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: context.w*0.02),
          child: suffix,
        ),
        hintText: text,
        hintStyle: AppStyles.robotoRegular16White,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      
    );
  }

  
}