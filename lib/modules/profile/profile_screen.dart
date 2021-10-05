import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          signOut(context);
        },
        icon: Icon(Icons.logout),
      ),
    );
  }
}
