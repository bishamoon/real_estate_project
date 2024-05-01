import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/card.dart';
import 'package:real_estate/models/allBuildingModel.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import '../../componets/appColors.dart';
import '../../componets/widgets/nearbyCard2.dart';

class NearMeScreen extends StatefulWidget {
  const NearMeScreen({super.key});

  @override
  State<NearMeScreen> createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen> {
  List<Datum> _nearMeBuildings = [];
  bool _isLoadingALlBuildings = false;

  @override
  void initState() {
    //getAllNearMeBuildings();
    super.initState();
  }

  /* getAllNearMeBuildings() async {
    setState(() {
      _isLoadingALlBuildings = true;
    });
    final response = await HttpHelper.getData(url: EndPoints.nearMeBuildings);
    if (response['success']) {
      final model = NearMeModel.fromJson(response);
      _nearMeBuildings.addAll(model.data);
    }
    _isLoadingALlBuildings = false;

    setState(() {});
  } */

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
            'المنازل القريبة',
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        final building = _nearMeBuildings[index];
                        return nearByCard2(
                          houseName: building.name,
                          area: building.buildingInfo.area,
                          imgUrl: "assets/img/houseimg.png",
                          location: building.buildingInfo.town,
                          price: building.cost,
                          noBed: building.buildingInfo.numberRooms,
                          noKitchen: building.buildingInfo.numberFloors,
                          noBath: building.buildingInfo.nzal,
                          type: building.name,
                        );
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
