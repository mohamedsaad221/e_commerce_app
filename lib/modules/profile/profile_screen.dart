import 'package:e_commerce_app/shared/components/custom_list_tile.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                    'https://i.imgur.com/sOzEw8d.png',
                  ),
                ),
                const SizedBox(width: 15.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Mohammed Saad',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'mohamedsaad@gmail.com',
                      style: TextStyle(
                        fontSize: 11.7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomListTile(
                    text: 'Edit Profile',
                    onPress: () {},
                    imageName: 'icon_edit_profile.png',
                  ),
                  CustomListTile(
                    text: 'Shipping Address',
                    onPress: () {},
                    imageName: 'icon_location.png',
                  ),
                  CustomListTile(
                    text: 'Order History',
                    onPress: () {},
                    imageName: 'icon_history.png',
                  ),
                  CustomListTile(
                    text: 'Carts',
                    onPress: () {},
                    imageName: 'icon_payment.png',
                  ),
                  CustomListTile(
                    text: 'Notification',
                    onPress: () {},
                    imageName: 'icon_alert.png',
                  ),
                  CustomListTile(
                    text: 'Log Out',
                    onPress: () {
                      signOut(context);
                    },
                    imageName: 'icon_exit.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
