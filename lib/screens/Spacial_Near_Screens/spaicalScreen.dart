import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/card.dart';
import 'package:real_estate/models/allBuildingModel.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import '../../componets/appColors.dart';
import '../../componets/widgets/nearbyCard2.dart';

class SpacialScreen extends StatefulWidget {
  const SpacialScreen({super.key});

  @override
  State<SpacialScreen> createState() => _SpacialScreenState();
}

class _SpacialScreenState extends State<SpacialScreen> {
  List<Datum> _allBuildengs = [];
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
      final model = AllBuildingModel.fromJson(response);
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
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconBackgroundColor),
                  child: Image.asset("assets/img/search.png")),
              onTap: () {},
            ),
          ),
        ],
        title: Center(
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
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: SizedBox(
                  width: 380,
                  height: 800,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _allBuildengs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final building = _allBuildengs[index];

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 7),
                          child: SpacialCard(
                            houseName: building.name,
                            area: building.buildingInfo.area,
                            imgUrl: "assets/img/houseimg.png",
                            location: building.buildingInfo.town,
                            price: building.cost,
                            noBed: building.buildingInfo.numberRooms,
                            noKitchen: building.buildingInfo.numberFloors,
                            noBath: building.buildingInfo.nzal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
