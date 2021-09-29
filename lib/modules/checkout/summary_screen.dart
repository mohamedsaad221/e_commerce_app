import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children:
              [
                Container(
                  width: 120.0,
                  padding: EdgeInsetsDirectional.only(
                      start: 10.0
                  ),
                  child: Image(
                    width: 120.0,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://i.imgur.com/82oYWA2.jpeg',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
