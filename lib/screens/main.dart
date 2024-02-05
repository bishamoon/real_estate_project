import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'auth/forgetpassword.dart';
import 'auth/signInScreen.dart';
import 'auth/signUpScreen.dart';
import 'homescreen/homeScreen.dart';

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
      home: const HomeScreen(),
      routes: {
        '/SignInScreen': (context) => SignInScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
        '/ForgetPassword': (context) => ForgetPassword(),
      },
    );
  }
}
