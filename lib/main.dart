import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/network/shared_helper.dart';
import 'package:real_estate/screens/Spacial_Near_Screens/nearMeScreen.dart';
import 'package:real_estate/screens/Spacial_Near_Screens/spaicalScreen.dart';
import 'package:real_estate/screens/dashboard/dashboard_screen.dart';
import 'package:real_estate/screens/homescreen/homeScreen.dart';
import 'package:real_estate/screens/profile/profile.dart';

import 'screens/auth/forgetpassword.dart';
import 'screens/auth/signInScreen.dart';
import 'screens/auth/signUpScreen.dart';
import 'screens/fav/favoriteScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = SharedHelper.getData(key: "token");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
     home: isLoggedIn != null ? const DashBoardScreen() : const SignInScreen(),
      //  home: const HomeScreen(),
      routes: {
        '/SignInScreen': (context) => const SignInScreen(),
        '/SignUpScreen': (context) => const SignUpScreen(),
        '/ForgetPassword': (context) => const ForgetPassword(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/FavoriteScreen': (context) => const FavoriteScreen(),
        "/dashBoard": (context) => const DashBoardScreen(),
        "/SpacialScreen": (context) => const SpacialScreen(),
        "/NearMeScreen": (context) => const NearMeScreen(),
      },
    );
  }
}
