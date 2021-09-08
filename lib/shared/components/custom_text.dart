import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  final int? maxLine;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  CustomText({
    this.text = '',
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.height = 1,
    this.maxLine,
    this.fontWeight,
    this.letterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text!,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
        maxLines: maxLine,
      ),
    );
  }
}