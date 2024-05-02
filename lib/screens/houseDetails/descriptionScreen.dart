import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/cardDetails.dart';
import 'package:real_estate/componets/widgets/cardSp.dart';
import 'package:real_estate/models/build_details_model.dart';

import '../../componets/appColors.dart';

class DescrptionScreen extends StatelessWidget {
  DescrptionScreen({super.key, required this.model});

  final BuildingDetails model;

  List names = ['الحديقة', 'خدمات', 'غرف نوم', 'مساحة'];
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
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                model.data.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                cardDetails(
                  name: names[0],
                  numberofItem: model.data.buildingInfo.garageArea.toString(),
                  urlOfImg: urlImg[0],
                ),
                cardDetails(
                  name: names[1],
                  numberofItem:
                      model.data.buildingInfo.numberServers.toString(),
                  urlOfImg: urlImg[1],
                ),
                cardDetails(
                  name: names[2],
                  numberofItem: model.data.buildingInfo.numberRooms.toString(),
                  urlOfImg: urlImg[2],
                ),
                cardDetails(
                  name: names[3],
                  numberofItem: "${model.data.buildingInfo.area.toString()}م",
                  urlOfImg: urlImg[3],
                ),
              ],
            ),
            const SizedBox(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              model.data.user.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                          ),
                          const Padding(
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
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconBackgroundColor),
                    child: Image.asset("assets/img/call.png"),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
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
            const SizedBox(
              height: 5,
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                model.data.buildingInfo.hotKatchen
                    ? cardSp(
                        name: nameSp[0],
                        urlOfImg: urlImgSp[0],
                      )
                    : const SizedBox(),
                model.data.buildingInfo.pool
                    ? cardSp(
                        name: nameSp[2],
                        urlOfImg: urlImgSp[2],
                      )
                    : const SizedBox(),
                model.data.buildingInfo.garageArea != 0
                    ? cardSp(
                        name: nameSp2[0],
                        urlOfImg: urlImgSp2[0],
                      )
                    : const SizedBox(),
                model.data.buildingInfo.laundryRoom
                    ? cardSp(
                        name: nameSp2[1],
                        urlOfImg: urlImgSp2[1],
                      )
                    : const SizedBox(),
                // cardSp(
                //   name: nameSp2[2],
                //   urlOfImg: urlImgSp2[2],
                // ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
                    child: const Text(
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
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
