
import 'package:flutter/material.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';

class CustomTextField extends StatelessWidget {
  bool ? filled;
  Color ? fillColor;
  Color ? borderColor;
  Widget ? prefix;
  Widget ? suffix;
  String text;
  bool obsecureText;
  TextInputType keyBoardType;
  TextEditingController? controller;
  void Function(String?)? onChanging;
  String? Function(String?)? onValidtator;
  CustomTextField({super.key,this.keyBoardType = TextInputType.text,this.obsecureText=false,this.controller,this.onChanging,this.onValidtator, this.fillColor,this.filled,this.prefix,this.suffix,required this.text,});

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
        border: buildDecorationBorder(borderColor: borderColor),
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefix,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: context.w*0.04),
          child: suffix,
        ),
        hintText: text,
        hintStyle: AppStyles.robotoRegular16White,
      ),
      
    );
  }

  OutlineInputBorder buildDecorationBorder({required borderColor}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: borderColor,
          width: 1
        )
    );
  }
}