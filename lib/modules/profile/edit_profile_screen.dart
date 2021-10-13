import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/modules/profile/profile_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        nameController.text = cubit.userModel!.name!;
        phoneController.text = cubit.userModel!.phone!;
        var profileImage = cubit.profileImage;
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
            title: Text('Edit Profile'),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    cubit.updateUserData(
                        name: nameController.text, phone: phoneController.text);
                  },
                  child: Text('UPDATE')),
              SizedBox(
                width: 15.0,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                        radius: 60.0,
                        backgroundImage: profileImage == null
                            ? NetworkImage(
                                '${cubit.userModel!.image}',
                              )
                            : FileImage(profileImage) as ImageProvider),
                    IconButton(
                        onPressed: () {
                          cubit.getProfileImage();
                        },
                        icon: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ))),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                    type: TextInputType.text,
                    controller: nameController,
                    text: 'Name',
                    hint: 'name',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'name must not be empty';
                      }
                    }),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                    type: TextInputType.text,
                    controller: phoneController,
                    text: 'phone',
                    hint: 'phone',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'phone must not be empty';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20.0,
                ),
                if (cubit.profileImage != null)
                  CustomButton(
                    onPressed: () {
                      cubit.uploadProfileImage(
                          name: nameController.text,
                          phone: phoneController.text);
                    },
                    text: 'Update Profile',
                  ),
                if (state is HomeUpdateUserLoadingState) SizedBox(height: 5.0),
                if (state is HomeUpdateUserLoadingState)
                  LinearProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
