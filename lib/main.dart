import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/modules/login/login_screen.dart';
import 'package:e_commerce_app/modules/splash/splash_screen.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:e_commerce_app/shared/my_bloc_observer.dart';
import 'package:e_commerce_app/shared/network/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  late Widget widget;
  String? uId;
  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myGreen,
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          color: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(startWidget: startWidget),
    );
  }
}
