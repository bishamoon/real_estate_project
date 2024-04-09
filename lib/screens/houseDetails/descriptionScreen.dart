import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/cardDetails.dart';
import 'package:real_estate/componets/widgets/cardSp.dart';

import '../../componets/appColors.dart';

class DescrptionScreen extends StatelessWidget {
  DescrptionScreen({super.key});

  List names = ['الحديقة', 'خدمات', 'غرف نوم', 'مساحة'];
  List numberOfIem = ['100 م', '2', '2', '200'];
  List urlImg = [
    "assets/img/garden.png",
    "assets/img/bathtub.png",
    "assets/img/bed2.png",
    "assets/img/area2.png"
  ];

  List urlImgSp = [
    "assets/img/mdi_kitchen-counter.png",
    "assets/img/tile.png",
    "assets/img/map_swimming.png",
  ];
  List urlImgSp2 = [
    "assets/img/car.png",
    "assets/img/map_laundry.png",
    "assets/img/floor.png",
  ];
  List nameSp = ["مطبخ ساخن", "سيراميك", "مسبح"];
  List nameSp2 = ["كراج", "غرفة غسيل", "طوابق"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "منزل باللون الابيض والأزرق يتميز بأطلالة مميزة",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: cardDetails(
                          name: names[index],
                          numberofItem: numberOfIem[index],
                          urlOfImg: urlImg[index],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/img/1.png'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Text(
                              'علا عبد الصبور',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Text(
                              'المالك',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconBackgroundColor),
                    child: Image.asset("assets/img/call.png"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "المميزات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: cardSp(
                      name: nameSp[index],
                      urlOfImg: urlImgSp[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cardSp(
                      name: nameSp2[index],
                      urlOfImg: urlImgSp2[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "العنوان",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "عرض على الخريطة",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5, // Adjust height as needed
              color: Colors.grey, // Adjust color as needed
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 380,
        height: 88,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 140,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(44),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "اتصل الان",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "السعر الكامل",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    Text(
                      "600,000,000 IQD",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
