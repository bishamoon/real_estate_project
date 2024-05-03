import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/is_loading_widget.dart';
import 'package:real_estate/componets/widgets/nearbyCard.dart';
import 'package:real_estate/models/building_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';

import '../../componets/appColors.dart';

class SpacialScreen extends StatefulWidget {
  const SpacialScreen({super.key});

  @override
  State<SpacialScreen> createState() => _SpacialScreenState();
}

class _SpacialScreenState extends State<SpacialScreen> {
  final List<DataBuildingModel> _allBuildengs = [];
  bool _isLoadingALlBuildings = false;

  @override
  void initState() {
    getAllBuildings();
    super.initState();
  }

  getAllBuildings() async {
    setState(() {
      _isLoadingALlBuildings = true;
    });
    final response = await HttpHelper.getData(url: EndPoints.allBuilding);
    if (response['success']) {
      final model = BuildingModel.fromJson(response);
      _allBuildengs.addAll(model.data);
    }
    _isLoadingALlBuildings = false;

    setState(() {});
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
            'المنازل المميزة',
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
        child: _isLoadingALlBuildings
            ? const IsLoadingWidget()
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _allBuildengs.length,
                itemBuilder: (BuildContext context, int index) {
                  final building = _allBuildengs[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 7),
                    child: nearByCard(
                      houseName: building.name,
                      area: building.buildingInfo.area,
                      imgUrl: "assets/img/houseimg.png",
                      location: building.buildingInfo.map,
                      price: building.cost,
                      noBed: building.buildingInfo.numberRooms,
                      noKitchen: building.buildingInfo.katchenNumber,
                      noBath: building.buildingInfo.numberServers,
                      type: building.typeBuild.name,
                      context: context,
                      id: building.id,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
