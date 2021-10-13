import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/modules/profile/track_order_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_list_tile.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        print(cubit.userModel!.email);
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
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '${cubit.userModel!.name}',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          maxLine: 3,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomText(
                          text: '${cubit.userModel!.email}',
                          fontWeight: FontWeight.normal,
                            fontSize: 11.7,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomListTile(
                        text: 'Edit Profile',
                        onPress: () {
                          navigateTo(context, EditProfileScreen());
                        },
                        imageName: 'icon_edit_profile.png',
                      ),
                      CustomListTile(
                        text: 'Order History',
                        onPress: () {
                          navigateTo(context, TrackOrderScreen());
                        },
                        imageName: 'icon_history.png',
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
      },
    );
  }
}
