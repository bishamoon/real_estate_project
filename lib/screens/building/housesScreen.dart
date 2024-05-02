import 'package:flutter/material.dart';
import 'package:real_estate/network/end_points.dart';

import '../../componets/appColors.dart';
import '../../network/http_helper.dart';

class HousesScreen extends StatefulWidget {
  const HousesScreen({super.key});

  @override
  State<HousesScreen> createState() => _HousesScreenState();
}

class _HousesScreenState extends State<HousesScreen> {
  // List<Datum> _buildingsByType = [];
  // bool _isLoadingBuildingsType = false;

  getBuildingsByType() async {
    setState(() {
      // _isLoadingBuildingsType = true;
    });

    final response = await HttpHelper.getData(url: EndPoints.buildingsByType);
    if (response['success']) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconBackgroundColor),
                  child: Image.asset("assets/img/search.png")),
              onTap: () {},
            ),
          ),
        ],
        title: const Center(
          child: Text(
            'المنازل',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 26,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            child: Image.asset("assets/img/ic_round-arrow-back.png"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SizedBox(
            width: 380,
            height: 800,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return const Text("asdasdldsa");
              },
            ),
          ),
        ),
      ),
    );
  }
}
