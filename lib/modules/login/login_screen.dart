import 'package:e_commerce_app/modules/home/home_screen.dart';
import 'package:e_commerce_app/modules/login/cubit/cubit.dart';
import 'package:e_commerce_app/modules/login/cubit/states.dart';
import 'package:e_commerce_app/modules/register/register_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_social_button.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/components/custom_text_form_field.dart';
import 'package:e_commerce_app/shared/network/local/shared_pref.dart';
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
        listener: (context, state) {
          if(state is LoginErrorState ){
            showToast(text: state.error, state: ShowToastColor.ERROR);
          }
          if(state is LoginSuccessState ){
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, HomeScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Welcome,',
                            fontSize: 30.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              // navigate to register screen
                              navigateTo(context, RegisterScreen());
                            },
                            child: CustomText(
                              text: 'Sign Up',
                              fontSize: 18.0,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Sign in to Continue',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        hint: 'name@example.com',
                        text: 'Email',
                      ),
                      SizedBox(height: 40.0),
                      CustomTextFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        },
                        hint: '********',
                        text: 'Password',
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixIcon: LoginCubit.get(context).suffix,
                        suffixPressed: () =>
                            LoginCubit.get(context).changePasswordVisibility(),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: CustomText(
                          text: 'Forget Password?',
                          fontSize: 14,
                          alignment: Alignment.topRight,
                        ),
                      ),
                      SizedBox(height: 20),
                      Conditional.single(
                        context: context,
                        conditionBuilder: (context) =>
                            state is! LoginErrorState,
                        widgetBuilder: (context) => CustomButton(
                          text: 'SIGN IN',
                          onPressed: () {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                        fallbackBuilder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: 20.0),
                      CustomText(
                        text: '-OR-',
                        alignment: Alignment.center,
                        fontSize: 18,
                      ),
                      SizedBox(height: 20),
                      CustomSocialButton(
                        text: 'Sign In with Facebook',
                        imageName: 'facebook.png',
                        onPressed: () {
                          LoginCubit.get(context).loginWithFaceBook();
                        },
                      ),
                      SizedBox(height: 20.0),
                      CustomSocialButton(
                        text: 'Sign In with Google',
                        imageName: 'google.png',
                        onPressed: () {
                          LoginCubit.get(context).googleSignInMethod(context);
                        },
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

