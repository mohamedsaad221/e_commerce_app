
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double radius;
  final double padding;

  CustomButton({
    required this.onPressed,
    this.text = 'write text',
    this.textColor = Colors.white,
    this.color = primaryColor,
    this.radius = 10.0,
    this.padding = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(padding)),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        color: textColor,
        alignment: Alignment.center,
      ),
    );
  }
}