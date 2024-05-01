import 'package:flutter/material.dart';

import '../appColors.dart';

Widget nearByCard2({
  required String houseName,
  required String imgUrl,
  required int area,
  required String location,
  required int price,
  required int noBed,
  required int noKitchen,
  required int noBath,
  required String type,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: 380,
      height: 120,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset("assets/img/Image.png"),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Positioned(
            right: 112,
            top: 13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  houseName,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Transform.translate(
                  offset: Offset(-35, 0),
                  child: Opacity(
                    opacity: 0.80,
                    child: Container(
                      width: 60,
                      height: 23,
                      decoration: ShapeDecoration(
                        color: AppColors.iconBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          type,
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                            height: 0.20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 112,
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
          Positioned(
            top: 65,
            right: 115,
            child: Text(
              price.toString(),
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 9,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
              top: 90,
              right: 107,
              child: Padding(
                padding: const EdgeInsets.only(right: 7, left: 5),
                child: Row(children: [
                  Text(
                    noKitchen.toString(),
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
                    width: 7,
                  ),
                  Text(
                    noBed.toString(),
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
                    width: 7,
                  ),
                  Text(
                    noBath.toString(),
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
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    area.toString(),
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
                ]),
              )),
        ],
      ),
    ),
  );
}
