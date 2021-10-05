
import 'package:e_commerce_app/modules/profile/profile_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        leading: GestureDetector(
          onTap: () {
            navigateAndFinish(context, ProfileScreen());
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text('Track Order'),
        centerTitle: true,
      ),
    );
  }
}
