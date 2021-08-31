import 'package:e_commerce_app/modules/login/cubit/cubit.dart';
import 'package:e_commerce_app/modules/login/cubit/states.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 60.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Welcome',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'sign in to continue',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          defaultTextButton(
                            function: () {},
                            text: 'Sign Up',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      labelText: 'Enter Your Name',
                      prefixIcon: IconBroken.User,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    defaultFormField(
                        controller: passWordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        },
                        labelText: 'Enter Your Password',
                        prefixIcon: IconBroken.Password,
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixIcon: LoginCubit.get(context).suffix,
                      suffixPressed: () => LoginCubit.get(context).changePasswordVisibility()
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultTextButton(
                          function: () {},
                          text: 'Forget Password?',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultTextMaterialButton(
                      function: () {},
                      text: 'Sign In',
                      colorText: Colors.white,
                      context: context,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        '-OR-',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
