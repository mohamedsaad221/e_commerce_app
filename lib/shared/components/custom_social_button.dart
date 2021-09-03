import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String? text;
  final String? imageName;
  final VoidCallback? onPressed;

  CustomSocialButton({
    this.text,
    this.imageName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: 10),
            Image.asset('assets/images/$imageName'),
            SizedBox(width: 50),
            CustomText(
              text: text,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}