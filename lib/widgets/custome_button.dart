import 'package:flutter/material.dart';
import 'package:movies/utitities/conext_extentions.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final TextStyle textStyle;
  final IconData? icon;
  final Color? iconColor;
  final double verticalPadding;

  const CustomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.textStyle,
    this.icon,
    this.iconColor,
    this.verticalPadding = 16,
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
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: textStyle),
          if (icon != null) ...[
            SizedBox(width: context.w*0.01),
            Icon(
              icon,
              color: iconColor ?? foregroundColor,
            ),
          ],
        ],
      ),
    );
  }
}