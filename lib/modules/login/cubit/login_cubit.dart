
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_rounded;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_off_rounded : Icons.visibility_outlined;

    emit(LoginPasswordVisibility());
  }

  final CollectionReference _userCollectionReference =
  FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionReference
        .doc(userModel.uId!)
        .set(userModel.toMap());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async{
    return await _userCollectionReference.doc(uid).get();
  }

  Future loginWithFaceBook() async{

    emit(LoginWithFaceBookLoadingState());


    final LoginResult result = await FacebookAuth.instance.login();

    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
       await FirebaseAuth.instance.signInWithCredential(credential)
           .then((user) {
             saveUser(user);
             emit(LoginWithFaceBookSuccessState());
       })
           .catchError((error){
             emit(LoginWithFaceBookErrorState(error));
       });
    }

    return null;

  }

  void googleSignInMethod(context) async {

    emit(LoginWithGoogleLoadingState());

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser!.authentication;

    final AuthCredential googleCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(googleCredential).then((user) async {
      saveUser(user);
      emit(LoginWithGoogleSuccessState());
      navigateAndFinish(context, HomeLayout());
      print(user);
    }).catchError((error) {
      emit(LoginWithGoogleErrorState(error));
    });
  }


  void saveUser(UserCredential userData) async {
    UserModel userModel = UserModel(
      uId: userData.user!.uid,
      email: userData.user!.email,
      name: userData.user!.displayName ,
      image: 'https://i.imgur.com/OYaZRYS.jpg',
    );

    await addUserToFireStore(userModel);
  }

  // register

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {

      createUser(
        name: name,
        email: email,
        uId: value.user!.uid,
        phone: phone,
      );

    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }


  void createUser({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }){

    UserModel model = UserModel(
      name: name,
      email: email,
      uId: uId,
      image:'https://i.imgur.com/OYaZRYS.jpg',
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap()).then((value) {
      emit(CreateUserSuccessState(uId));
    }).catchError((error){
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  final isPadding = true;


}