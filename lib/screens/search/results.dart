import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/is_loading_widget.dart';
import 'package:real_estate/componets/widgets/nearbyCard.dart';
import 'package:real_estate/models/building_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';

import '../../componets/appColors.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.type, required this.searchResults});

  final String type;
   final List<DataBuildingModel> searchResults;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {

  bool _isLoading = false;

  @override
  void initState() {
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
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, "/SearchScreen");
                });
              },
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
            } else if (widget.searchResults.isEmpty) {
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
            } else if (widget.searchResults.isNotEmpty) {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: widget.searchResults.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final building = widget.searchResults[index];

                  return nearByCard(
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
