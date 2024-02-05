import 'package:flutter/material.dart';

import '../appColors.dart';

Widget nearByCard({
  String? houseName,
  String? imgUrl,
  int? area,
  String? location,
  int? price,
  int noBed = 0, //handel
  int noKitchen = 0,
  int noBath = 0,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: 327,
      height: 108,
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
                  'منزل ذو طابع عصري',
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
                Opacity(
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
                        'منزل',
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
                  "بغداد,المنصور",
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
            top: 60,
            right: 115,
            child: Text(
              'IQD 400,000,000',
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 9,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
              top: 80,
              right: 107,
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
                    width: 7,
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
                    width: 7,
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
                  SizedBox(
                    width: 12,
                  ),
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
                ]),
              )),
        ],
      ),
    ),
  );
}
