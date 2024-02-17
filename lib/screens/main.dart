import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/building/land.dart';
import 'package:real_estate/screens/homescreen/homeScreen.dart';
import 'auth/forgetpassword.dart';
import 'auth/signInScreen.dart';
import 'auth/signUpScreen.dart';
import 'building/land.dart';
import 'noFav.dart';
import 'favoriteScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: NoFav(),
      routes: {
        '/SignInScreen': (context) => SignInScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
        '/ForgetPassword': (context) => ForgetPassword(),
        '/HomeScreen': (context) => HomeScreen(),
        '/FavoriteScreen': (context) => FavoriteScreen(),
      },
    );
  }
}
