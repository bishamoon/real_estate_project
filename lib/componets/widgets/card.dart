import 'package:flutter/material.dart';
import 'package:real_estate/screens/houseDetails/houseDetails1.dart';

import '../appColors.dart';

Widget SpacialCard({
  required String houseName,
  required String imgUrl,
  required int area,
  required String location,
  required int price,
  required int noBed,
  required int noKitchen,
  required int noBath,
  required String id,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HouseDetails1(id: id)));
    },
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 220,
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Image.asset(
                imgUrl,
                width: 220,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  houseName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // const SizedBox(
                //   width: 75,
                // ),
                Text(
                  '$price \$ ',
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Image.asset("assets/img/location.png"),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: AppColors.gray,
                    fontSize: 10,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '$noKitchen ',
                      style: const TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Image.asset("assets/img/cook.png"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$noBed',
                      style: const TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Image.asset("assets/img/bed.png"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$noBath',
                      style: const TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Image.asset("assets/img/bath.png"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$area sqft',
                      style: const TextStyle(
                        color: AppColors.gray,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Image.asset("assets/img/area.png")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
