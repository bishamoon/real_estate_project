import 'package:flutter/material.dart';
import 'package:real_estate/componets/widgets/defaultsearchField.dart';
import 'package:real_estate/models/allBuildingModel.dart';
import 'package:real_estate/models/buildingsByType.dart';
import 'package:real_estate/models/buildingsNear_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import 'package:real_estate/screens/building/apartmentsScreen.dart';
import 'package:http/http.dart' as http; // Import the http package
import '../../componets/widgets/card.dart';
import '../../componets/widgets/categoryContainer.dart';
import '../../componets/widgets/nearbyCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  List _allBuildengs = [];
  List<NearMeModel> _nearMeBuildings = [];

  bool _isLoadingALlBuildings = false;
  bool _isLoadingNearBuildings = false;

  @override
  void initState() {
    getAllBuildings();
    //getNearBuildings();
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

  /* getNearBuildings() async {
    setState(() {
      _isLoadingNearBuildings = true;
    });
    final response = await HttpHelper.getData(url: EndPoints.nearMeBuildings);
    if (response['success']) {
      //change model>>>>>>
      final model = AllBuildingModel.fromJson(response);
      _allBuildengs.addAll(model.data);
    }
    _isLoadingNearBuildings = false;

    setState(() {});
  }
 */
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Text(
                            'مرحبا ,',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Text(
                            'نور سعد',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultSearchField(
                    prefix: Image.asset(
                      "assets/img/search.png",
                    ),
                    suffix: GestureDetector(
                      onTap: () {
                        //go to filter page
                      },
                      child: Image.asset(
                        "assets/img/fliter.png",
                      ),
                    ),
                    width: 383,
                    height: 57,
                    hintText: 'ابحث عن شقة , منزل',
                    controller: _searchController,
                    onChanged: (s) {},
                    validator: (s) {
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        String categoryText = index == 0
                            ? "شقة"
                            : index == 1
                                ? "منزل"
                                : index == 2
                                    ? "بناية"
                                    : index == 3
                                        ? "ارض"
                                        : index == 4
                                            ? "مكتب"
                                            : "متجر";

                        return CategoryContainer(
                          text: categoryText,
                          onTap: () {
                            navigateToCategoryPage(context, categoryText);
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 12, top: 4),
                      child: Text(
                        'المنازل المميزة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "/SpacialScreen");
                          });
                        },
                        child: Row(
                          children: [
                            const Text(
                              'عرض المزيد',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF323030),
                                fontSize: 14,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            Image.asset("assets/img/arrow-back.png")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                _isLoadingALlBuildings
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: SizedBox(
                          height: 260,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _allBuildengs.length,
                            itemBuilder: (BuildContext context, int index) {
                              final building = _allBuildengs[index];

                              return SpacialCard(
                                houseName: building.data[index].name,
                                area: building.data[index].buildingInfo.area,
                                imgUrl: "assets/img/houseimg.png",
                                location: building.data[index].buildingInfo.town,
                                price: building.data[index].cost,
                                noBed: building.data[index].buildingInfo.numberRooms,
                                noKitchen: building.data[index].buildingInfo.numberFloors,
                                noBath: building.data[index].buildingInfo.numberServers,
                              );
                            },
                          ),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'عقارات بالقرب منك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/NearMeScreen");
                        },
                        child: Row(
                          children: [
                            const Text(
                              'عرض المزيد',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF323030),
                                fontSize: 14,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            Image.asset("assets/img/arrow-back.png")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
               /*  _isLoadingNearBuildings
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              //edit it based on model near me ... 
                              final building = _nearMeBuildings[index];
                              return nearByCard(
                                houseName: building.name,
                                area: building.buildingInfo.area,
                                imgUrl: "assets/img/houseimg.png",
                                location: building.buildingInfo.town,
                                price: building.cost,
                                noBed: building.buildingInfo.numberRooms,
                                noKitchen: building.buildingInfo.numberFloors,
                                noBath: building.buildingInfo.nzal,
                              );
                            },
                          ),
                        ),
                      ), */
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToCategoryPage(BuildContext context, String categoryText) {
    if (categoryText == "منزل") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ApartmentsScreen()));
    } else if (categoryText == "شقة") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ApartmentsScreen()));
    } else if (categoryText == "بناية") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ApartmentsScreen()));
    } else if (categoryText == "ارض") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ApartmentsScreen()));
    } else if (categoryText == "متجر") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ApartmentsScreen()));
    } else if (categoryText == "مكتب") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ApartmentsScreen()));
    }
  }
}
