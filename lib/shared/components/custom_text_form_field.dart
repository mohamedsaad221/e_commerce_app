
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String? text;
  final String? hint;
  final VoidCallback? onSubmit;
  final Function? onChange;
  final FormFieldValidator? validate;
  final String? labelText;
  final IconData? prefixIcon;
  final Function()? onTap;
  final IconData? suffixIcon;
  final bool isPassword;
  final Function? suffixPressed;

  CustomTextFormField({
    required this.controller,
    required this.type,
    required this.text,
    required this.hint,
    this.onSubmit,
    this.onChange,
    required this.validate,
    this.labelText,
    this.prefixIcon,
    this.onTap,
    this.suffixIcon,
    this.isPassword = false,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: (s) {
              if (onSubmit != null) {
                onSubmit!();
              }
            },
            onChanged: (s) {
              if (onChange != null) {
                onChange!(s);
              }
            },
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            validator: validate,
            obscureText: isPassword,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: labelText,
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: IconButton(
                icon: Icon(suffixIcon),
                onPressed: () {
                  suffixPressed!();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}