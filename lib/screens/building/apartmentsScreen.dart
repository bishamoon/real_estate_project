import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/is_loading_widget.dart';
import 'package:real_estate/componets/widgets/nearbyCard.dart';
import 'package:real_estate/models/building_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';

import '../../componets/appColors.dart';

class ApartmentsScreen extends StatefulWidget {
  const ApartmentsScreen({super.key, required this.type});

  final String type;

  @override
  State<ApartmentsScreen> createState() => _ApartmentsScreenState();
}

class _ApartmentsScreenState extends State<ApartmentsScreen> {
  bool _isLoading = false;
  final List<DataBuildingModel> _buildings = [];

  getBuildings() async {
    setState(() {
      _isLoading = true;
    });
    final response = await HttpHelper.postData(
        url: EndPoints.buildingsByType, body: {"name": widget.type});
    if (response['success']) {
      if (response['data'] != null && response['data'].isNotEmpty) {
        final data = ((response['data'][0]['Building']) as List)
            .map((e) => DataBuildingModel.fromJson(e))
            .toList();
        _buildings.addAll(data);
      } else {
        _buildings.clear();
      }
    }
    _isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    getBuildings();
    super.initState();
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
        title: Center(
          child: Text(
            widget.type,
            textAlign: TextAlign.center,
            style: const TextStyle(
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
            } else if (_buildings.isEmpty) {
              return const SizedBox(
                height: 260,
                child: Center(
                  child: Text(
                    "لا يوجد عقارات حالياً",
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
            } else if (_buildings.isNotEmpty) {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: _buildings.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final building = _buildings[index];

                  return nearByCard(
                    houseName: building.name,
                    area: building.buildingInfo.area,
                    imgUrl: "assets/img/houseimg.png",
                    location: building.buildingInfo.town,
                    price: building.cost,
                    noBed: building.buildingInfo.numberRooms,
                    noKitchen: building.buildingInfo.numberFloors,
                    noBath: building.buildingInfo.numberServers,
                    type: widget.type,
                    context: context,
                    id: building.id,
                  );
                },
              );
            } else {
              return const Center(child: Text("Error"));
            }
          })),
    );
  }
}
