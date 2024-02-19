import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/componets/widgets/addButton.dart';

import '../componets/widgets/customNavBar.dart';

class NoFav extends StatelessWidget {
  const NoFav({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFloatingActionButton(),
            SizedBox(
              height: 80,
            ),
            Text(
              "انقر فوق زر اضافة أعلاه لبدء\n  .الاستكشاف واختيار العقارات المفضلة لديك",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 83, 88, 128),
                fontSize: 14,
                fontFamily: "Cairo",
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(context: context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 45),
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
         )
    );
  }
}
