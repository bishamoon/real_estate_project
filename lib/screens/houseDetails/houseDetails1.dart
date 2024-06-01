import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/models/build_details_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import 'package:real_estate/screens/houseDetails/descriptionScreen.dart';
import 'package:real_estate/screens/houseDetails/photosScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class HouseDetails1 extends StatefulWidget {
  const HouseDetails1({super.key, required this.id});
  final String id;

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
    getDetails();
  }

  makeCall({required String phoneNumber}) async {
    var launch = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launch);
  }

  bool _isLoading = false;

  BuildingDetails? _buildingDetails;

  getDetails() async {
    setState(() {
      _isLoading = true;
    });
    final response =
        await HttpHelper.getData(url: "${EndPoints.buildingById}/${widget.id}");
    if (response['success']) {
      _buildingDetails = BuildingDetails.fromJson(response);
    }
    _isLoading = false;

    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _isLoading
          ? null
          : Container(
              width: 380,
              height: 88,
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        makeCall(
                            phoneNumber:
                                _buildingDetails?.data.phoneNumber.toString() ??
                                    "00000");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 140,
                          height: 56,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(44),
                            ),
                          ),
                          child: const Center(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
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
                            "${_buildingDetails?.data.cost.toString()} \$",
                            style: const TextStyle(
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
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            _buildingDetails!.data.buildingInfo.photos[0],
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
                                    decoration: const BoxDecoration(
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.iconBackgroundColor),
                                      child: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "تاريخ النشر: ${DateFormat('yyyy-MM-dd').format(_buildingDetails!.data.date)}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(9),
                              width: 155,
                              height: 34,
                              decoration: BoxDecoration(
                                color: AppColors.iconBackgroundColor,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Center(
                                child: Text(
                                  _buildingDetails?.data.status.name ?? "حالة",
                                  style: const TextStyle(
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
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _buildingDetails?.data.name ?? "الاسم",
                              style: const TextStyle(
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
                              "${_buildingDetails?.data.buildingInfo.town ?? "مدينة"} - ${_buildingDetails?.data.buildingInfo.map ?? "محافظة"}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          controller: _tabController,
                          unselectedLabelColor: Colors.black,
                          labelColor: AppColors.secondaryColor,
                          labelStyle: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 15,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w500,
                          ),
                          indicatorWeight: 3,
                          indicator: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors
                                    .secondaryColor, // Change color of the indicator line
                                width:
                                    2.0, // Change height of the indicator line
                              ),
                            ),
                          ),
                          tabs: const [
                            Tab(
                              text: "الوصف",
                            ),
                            Tab(
                              text: "الصور",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            DescrptionScreen(
                              model: _buildingDetails!,
                            ),
                            PhotosScreen(
                              model: _buildingDetails!,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
