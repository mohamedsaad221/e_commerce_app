import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback? onSubmit,
  Function? onChange,
  required FormFieldValidator validate,
  required String labelText,
  IconData? prefixIcon,
  VoidCallback? onTap,
  IconData? suffixIcon,
  bool isPassword = false,
  Function? suffixPressed,
}) => TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        if (onSubmit != null) {
          onSubmit();
        }
      },
      onChanged: (s) {
        if (onChange != null) {
          onChange(s);
        }
      },
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: () {
            suffixPressed!();
          },
        ),
      ),
    );

Widget defaultTextButton({required Function function, required String text}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(text),
    );

void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultTextMaterialButton({
  required Function function,
  required String text,
  colorText,
  context,
}) => Container(
      width: double.infinity,
      height: 50.0,
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: colorText),
        ),
      ),
    );

Widget defaultLoginSocialBottom({
  required GestureTapCallback onTab,
  required context,
  required String image,
}) => InkWell(
      onTap: () {
        onTab();
      },
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
        )),
        child: Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Image(
              image: AssetImage(image),
            ),
            SizedBox(
              width: 55.0,
            ),
            Text(
              'Sign in With Facebook',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );

void showToast({
  required String text,
  required ShowToastColor state,

}) =>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ShowToastColor {SUCCESS, ERROR, WARING}

Color chooseToastColor(ShowToastColor state) {

  Color color;

  switch(state) {
    case ShowToastColor.SUCCESS:
      color = Colors.green;
      break;
    case ShowToastColor.ERROR:
      color = Colors.red;
      break;
    case ShowToastColor.WARING:
      color = Colors.amberAccent;
      break;

  }
  return color;
}





