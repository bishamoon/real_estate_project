import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BuildContext context;

  const CustomBottomNavigationBar({required this.context});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomAppBar(
        height: 66,
        elevation: 0.0,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 5.0),
            GestureDetector(
              child: Image.asset("assets/img/Home.png"),
              onTap: () {
                Navigator.pushNamed(context, '/HomeScreen');
              },
            ),
            SizedBox(width: 55.0),
            GestureDetector(
              child: Image.asset("assets/img/seearch.png"),
              onTap: () {},
            ),
            const SizedBox(width: 155.0),
            GestureDetector(
              child: Image.asset(
                "assets/img/heart.png",
              ),
              onTap: () {
                Navigator.pushNamed(context, '/FavoriteScreen');
              },
            ),
            const SizedBox(width: 36.0),
            Transform.translate(
              offset: const Offset(-11, 0),
              child: GestureDetector(
                child: Image.asset("assets/img/person.png"),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
