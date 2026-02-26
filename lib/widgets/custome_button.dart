import 'package:flutter/material.dart';
import 'package:movies/utitities/conext_extentions.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final TextStyle textStyle;

  final Widget? leftIcon;   
  final Widget? rightIcon; 

  final bool isMax;

  const CustomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.textStyle,
    required this.isMax,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: BorderSide(
          width: 1,
          color: borderColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: context.h * 0.03,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: isMax ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leftIcon != null) ...[
            leftIcon!,
            SizedBox(width: context.w * 0.02),
          ],

          Text(text, style: textStyle),

          if (rightIcon != null) ...[
            SizedBox(width: context.w * 0.02),
            rightIcon!,
          ],
        ],
      ),
    );
  }
}