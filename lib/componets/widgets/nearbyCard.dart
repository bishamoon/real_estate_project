import 'package:flutter/material.dart';
import 'package:real_estate/screens/houseDetails/houseDetails1.dart';

import '../appColors.dart';

Widget nearByCard({
  required String houseName,
  required String imgUrl,
  required int area,
  required String location,
  required int price,
  required int noBed,
  required int noKitchen,
  required int noBath,
  required String type,
  required BuildContext context,
  required String id,
   Function()? delete,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HouseDetails1(id: id)));
    },
    onLongPress: delete,
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        width: 327,
        height: 110,
        child: Row(
          children: [
            Expanded(
              child: Image.network(imgUrl),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        houseName,
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
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
                              type,
                              style: const TextStyle(
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
                  const SizedBox(height: 2),
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
                  const SizedBox(height: 2),
                  Text(
                    "$price \$",
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              noKitchen.toString(),
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
                              width: 7,
                            ),
                            Text(
                              noBed.toString(),
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
                              width: 7,
                            ),
                            Text(
                              noBath.toString(),
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
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              area.toString(),
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
                            Image.asset("assets/img/area.png"),
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
