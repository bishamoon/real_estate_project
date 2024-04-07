import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/fav/favoriteScreen.dart';
import 'package:real_estate/screens/homescreen/homeScreen.dart';
import 'package:real_estate/screens/search/searchScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

final List<Widget> screens = [
  const HomeScreen(),
  const SearchScreen(),
  const FavoriteScreen(),
  const Text('person'),
];
int _currentIndex = 0;

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 66,
            elevation: 0.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Image.asset("assets/img/Home.png"),
                  onTap: () {
                    // Navigator.pushNamed(context, '/HomeScreen');
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                GestureDetector(
                  child: Image.asset("assets/img/seearch.png"),
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                
                const SizedBox(),
                const SizedBox(),
                const SizedBox(),
                
                GestureDetector(
                  child: Image.asset(
                    "assets/img/heart.png",
                  ),
                  onTap: () {
                    // Navigator.pushNamed(context, '/FavoriteScreen');
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                GestureDetector(
                  child: Image.asset("assets/img/person.png"),
                  onTap: () {},
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(top: 45),
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              onPressed: () => debugPrint("Add Button pressed"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: GestureDetector(
                child: Image.asset("assets/img/write.png"),
                onTap: () {},
              ),
            ),
          ),
          body: screens[_currentIndex],
        ));
  }
}
