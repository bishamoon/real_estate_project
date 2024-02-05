import 'package:flutter/material.dart';

import '../appColors.dart';

Widget SpacialCard({
  required String houseName,
  required String imgUrl,
  required int area,
  required String location,
  required int price,
  int noBed = 0, //handel
  int noKitchen = 0,
  int noBath = 0,
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      width: 220,
      height: 250,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -11,
            right: 10,
            child: Image.asset(
              imgUrl,
              height: 190,
              width: 200,
            ),
          ),
          Positioned(
            top: 159,
            right: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 7),
              child: Row(
                children: [
                  Text(
                    houseName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Text(
                    '$price \$ ',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 12,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 188,
            right: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                children: [
                  Image.asset("assets/img/location.png"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 10,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 219,
              right: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 7, left: 5),
                child: Row(children: [
                  Text(
                    '1 ',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Image.asset("assets/img/cook.png"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Image.asset("assets/img/bed.png"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Image.asset("assets/img/bath.png"),
                ]),
              )),
          Positioned(
            top: 219,
            right: 160,
            child: Row(
              children: [
                Text(
                  '2000sqft',
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Image.asset("assets/img/area.png")
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
