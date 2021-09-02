
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  CustomButton({
    required this.onPressed,
    this.text = 'write text',
    this.textColor = Colors.white,
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(18)),
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