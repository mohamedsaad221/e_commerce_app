import 'package:e_commerce_app/modules/login/login_screen.dart';
import 'package:e_commerce_app/shared/network/local/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1.0);
// const primaryColor = Colors.black;

const myGrey = Color.fromRGBO(245, 245, 245, 1.0);

MaterialColor myGreen = const MaterialColor(
  0xFF00C569,
  const {
    50: const Color(0xFF00C569),
    100: const Color(0xFF00C569),
    200: const Color(0xFF00C569),
    300: const Color(0xFF00C569),
    400: const Color(0xFF00C569),
    500: const Color(0xFF00C569),
    600: const Color(0xFF00C569),
    700: const Color(0xFF00C569),
    800: const Color(0xFF00C569),
    900: const Color(0xFF00C569),
  },
);

String? uId;

String tableName = 'cartProduct';

void signOut(BuildContext context) {
  CacheHelper.removeData(key: 'uId').then((value) {
    FirebaseAuth.instance.signOut();
    navigateAndFinish(context, LoginScreen());
  });
}

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);
