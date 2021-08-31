import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback? onSubmit,
  Function? onChange,
  required FormFieldValidator validate,
  required String labelText,
  required IconData prefixIcon,
  VoidCallback? onTap,
  IconData? suffixIcon,
  bool isPassword = false,
  Function? suffixPressed
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s){
          if(onSubmit != null){
            onSubmit();
          }
        },
        onChanged: (s){
          if(onChange != null){
            onChange(s);
          }
        },
        onTap: (){
          if(onTap != null){
            onTap();
          }
        },
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(),
          suffixIcon: IconButton(icon: Icon(suffixIcon), onPressed: (){suffixPressed!();},),
        )
    );

Widget defaultTextButton({
  required Function function,
  required String text
}) => TextButton(
  onPressed: (){
    function();
  },
  child: Text(text),
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);


Widget defaultTextMaterialButton({required Function function, required String text , colorText, context}) => Container(
  width: double.infinity,
  height: 50.0,
  color: Theme.of(context).primaryColor,
  child: MaterialButton(
    onPressed: (){function();} ,
    child: Text(text.toUpperCase(), style: TextStyle(color: colorText),),
  ),
);