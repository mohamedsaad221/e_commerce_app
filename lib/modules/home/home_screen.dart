import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: Icon(
                Icons.logout_outlined,
              )),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text('Home'),
          ),
        ],
      ),
    );
  }
}
