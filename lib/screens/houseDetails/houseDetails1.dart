import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/houseDetails/photosScreen.dart';

import 'descriptionScreen.dart';

class HouseDetails1 extends StatefulWidget {
  const HouseDetails1({super.key});

  @override
  State<HouseDetails1> createState() => _HouseDetails1State();
}

class _HouseDetails1State extends State<HouseDetails1>
    with SingleTickerProviderStateMixin {
  bool _isPressed = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> listOfWidget = [DescrptionScreen(), PhotosScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/img/photo.jpg",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 50,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              _isPressed
                                  ? "assets/img/heart.png"
                                  : "assets/img/fillHeart.png",
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _isPressed = false;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تاريخ النشر : 2023/12/10",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(9),
                      width: 155,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.iconBackgroundColor,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Center(
                        child: Text(
                          "للأيجار",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 15,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "منزل فخم افتراضي",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "شارع 14 رمضان ,المنصور , بغداد ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  unselectedLabelColor: Colors.black,
                  labelColor: AppColors.secondaryColor,
                  labelStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorWeight: 3,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors
                            .secondaryColor, // Change color of the indicator line
                        width: 2.0, // Change height of the indicator line
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      text: "الوصف",
                    ),
                    Tab(
                      text: "الصور",
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [listOfWidget[0], listOfWidget[1]],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
