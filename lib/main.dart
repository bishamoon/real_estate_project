import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/dashboard/dashboard_screen.dart';
import 'package:real_estate/screens/homescreen/homeScreen.dart';
import 'package:real_estate/screens/houseDetails/houseDetails1.dart';
import 'screens/addNewHouse/addNewHouse.dart';
import 'screens/addNewHouse/addNewHouse3.dart';
import 'screens/addNewHouse/addnewHouse2.dart';
import 'screens/auth/forgetpassword.dart';
import 'screens/auth/signInScreen.dart';
import 'screens/auth/signUpScreen.dart';
import 'screens/fav/favoriteScreen.dart';
import 'screens/profile/editProfile.dart';
import 'screens/profile/profile.dart';

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
      home: HouseDetails1(),
      routes: {
        '/SignInScreen': (context) => const SignInScreen(),
        '/SignUpScreen': (context) => const SignUpScreen(),
        '/ForgetPassword': (context) => const ForgetPassword(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/FavoriteScreen': (context) => const FavoriteScreen(),
      },
    );
  }
}
