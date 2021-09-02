
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/modules/login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  void loginWithFaceBook() async{

    emit(LoginWithFaceBookLoadingState());


    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value) {
       emit(LoginWithFaceBookSuccessState());
     }).catchError((error){
       emit(LoginWithFaceBookErrorState(error));
     });


  }

  void googleSignInMethod() async {

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser!.authentication;

    final AuthCredential googleCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(googleCredential).then((user) async {
      saveUser(user);
      //navigate to home layout here
      print(user);
    });
  }


  void saveUser(UserCredential userData) async {
    UserModel userModel = UserModel(
      uId: userData.user!.uid,
      email: userData.user!.email,
      name: userData.user!.displayName ,
      image: 'default',
    );

    await addUserToFireStore(userModel);
  }



}