import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/modules/login/cubit/cubit.dart';
import 'package:e_commerce_app/modules/login/cubit/states.dart';
import 'package:e_commerce_app/modules/login/login_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/components/custom_text_form_field.dart';
import 'package:e_commerce_app/shared/network/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is RegisterErrorState){
            showToast(text: state.error, state: ShowToastColor.ERROR);
          }
          if(state is CreateUserSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, HomeLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              toolbarHeight: 80.0,
              leading: GestureDetector(
                onTap: () {
                  navigateAndFinish(context, LoginScreen());
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    right: 20.0,
                    left: 20.0,
                    bottom: 10.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Sign Up',
                          fontSize: 30.0,
                        ),
                        SizedBox(height: 30),
                        CustomTextFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'name must not be empty';
                            }
                            return null;
                          },
                          hint: 'username',
                          text: 'Name',
                        ),
                        SizedBox(height: 40.0),
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
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          hint: '01xxxxxxxxx',
                          text: 'Phone',
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
                          suffixPressed: () => LoginCubit.get(context)
                              .changePasswordVisibility(),
                        ),
                        SizedBox(height: 20),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! LoginErrorState,
                          widgetBuilder: (context) => CustomButton(
                            text: 'SIGN Up',
                            onPressed: () {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                          ),
                          fallbackBuilder: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
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
