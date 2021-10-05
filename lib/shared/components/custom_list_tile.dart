import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final Function()? onPress;
  final String? text;
  final String? imageName;

  const CustomListTile({Key? key, this.onPress , this.text, this.imageName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPress,
        child: ListTile(
          title: CustomText(
            text: text,
            fontSize: 18.0,
          ),
          leading: Container(
            width: 50.0,
            child: Image.asset(
              'assets/menu_icons/$imageName'
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined
          ),
        ),
      ),
    );
  }
}
