import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/modules/login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_rounded;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
    isPassword ? Icons.visibility_off_rounded : Icons.visibility_outlined;

    emit(SocialLoginPasswordVisibility());
  }

  // UserModel userModel;
  //
  // void loginWithFaceBook() async{
  //
  //   LoginResult result = await FacebookAuth.instance.login();
  //
  //   final accessToken = result.accessToken!.token;
  //
  //
  //
  // }


}