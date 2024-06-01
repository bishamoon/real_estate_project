import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/is_loading_widget.dart';
import 'package:real_estate/componets/widgets/nearbyCard.dart';
import 'package:real_estate/models/building_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';

import '../../componets/appColors.dart';

class NearMeScreen extends StatefulWidget {
  const NearMeScreen({super.key});

  @override
  State<NearMeScreen> createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen> {
  final List<DataBuildingModel> _nearMeBuildings = [];
  bool _isLoading = false;

  @override
  void initState() {
    getAllNearMeBuildings();
    super.initState();
  }

  getAllNearMeBuildings() async {
    setState(() {
      _isLoading = true;
    });
    final response = await HttpHelper.getData(url: EndPoints.nearMeBuildings);
    if (response['success']) {
      final model = BuildingModel.fromJson(response);
      _nearMeBuildings.addAll(model.data);
    }
    _isLoading = false;

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
            'العقارات القريبة',
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
        child: Builder(builder: (_) {
          if (_isLoading) {
            return const IsLoadingWidget();
          } else if (_nearMeBuildings.isEmpty) {
            return const SizedBox(
              height: 110,
              child: Center(
                child: Text(
                  "لا يوجد عقارات بالقرب منك",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            );
          } else if (_nearMeBuildings.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: _nearMeBuildings.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (BuildContext context, int index) {
                final building = _nearMeBuildings[index];
                return nearByCard(
                  houseName: building.name,
                  area: building.buildingInfo.area,
                  imgUrl: building.buildingInfo.photos[0],
                  location: building.buildingInfo.map,
                  price: building.cost,
                  noBed: building.buildingInfo.numberRooms,
                  noKitchen: building.buildingInfo.katchenNumber,
                  noBath: building.buildingInfo.numberServers,
                  type: building.typeBuild.name,
                  context: context,
                  id: building.id,
                );
              },
            );
          } else {
            return const Center(child: Text("Error"));
          }
        }),
      ),
    );
  }
}
