import 'package:e_commerce_app/modules/login/cubit/cubit.dart';
import 'package:e_commerce_app/modules/login/cubit/states.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 5.0
                                    ),
                                    child: Text(
                                      'sign in to continue',
                                      style: Theme.of(context).textTheme.caption,

                                    ),
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
                        controller: emailController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
                        labelText: 'Email',
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          labelText: 'Password',
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixIcon: LoginCubit.get(context).suffix,
                          suffixPressed: () =>
                              LoginCubit.get(context).changePasswordVisibility()),
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
                      Conditional.single(
                        context: context,
                        conditionBuilder: (context) => state is! LoginErrorState,
                        widgetBuilder: (context) => defaultTextMaterialButton(
                          context: context,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: 'Login',
                          colorText: Colors.white,
                        ),
                        fallbackBuilder: (context) =>
                            Center(child: CircularProgressIndicator()),
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
                      defaultLoginSocialBottom(
                        onTab: () {
                          LoginCubit.get(context).loginWithFaceBook();
                        },
                        context: context,
                        image: 'assets/images/facebook.png'
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultLoginSocialBottom(
                          onTab: () {
                            // login with google
                          },
                          context: context,
                          image: 'assets/images/google.png'
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
