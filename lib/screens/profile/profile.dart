import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/componets/widgets/is_loading_widget.dart';
import 'package:real_estate/models/building_model.dart';

import '../../componets/widgets/nearbyCard.dart';
import '../../models/user_model.dart';
import '../../network/end_points.dart';
import '../../network/http_helper.dart';
import '../../network/shared_helper.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isLoadingAccount = false;
  bool _isLoadingBuilding = false;
  List<DataBuildingModel> _myBuildings = [];

  @override
  void initState() {
    // TODO: implement initState
    getMyAccount();
    getAllBuildings();
    super.initState();
  }

  UserModelData? _user;
  getMyAccount() async {
    setState(() {
      _isLoadingAccount = true;
    });
    final id = await SharedHelper.getData(key: "user_id");
    final response =
        await HttpHelper.getData(url: "${EndPoints.getUserById}/$id");
    if (response['success']) {
      final UserModel data = UserModel.fromJson(response);
      _user = data.data;
    } else {
      _isLoadingAccount = false;
      print("errror = ${response['message']}");
    }
    _isLoadingAccount = false;
    setState(() {});
  }

  getAllBuildings() async {
    setState(() {
      _isLoadingBuilding = true;
    });
    final myId = await SharedHelper.getData(key: "user_id");
    final response = await HttpHelper.getData(url: EndPoints.allBuilding);
    if (response['success']) {
      final model = BuildingModel.fromJson(response);
      _myBuildings =
          model.data.where((element) => element.userId == myId).toList();
    }
    _isLoadingBuilding = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("الصفحة الشخصية",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, "/EditScreen");
                        });
                      },
                      child: Image.asset("assets/img/edit.png"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50, // Adjust the size of the circle as needed
                      backgroundColor:
                          Colors.grey, // Background color of the circle
                      backgroundImage: AssetImage(
                          'assets/img/imgprofile.png'), // Image to be displayed inside the circle
                      // You can also use NetworkImage for images from the internet: NetworkImage('url_of_image')
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _isLoadingAccount
                          ? "جاري التحميل..."
                          : _user?.name ?? "زائر",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      _isLoadingAccount
                          ? "جاري التحميل..."
                          : _user?.email ?? "زائر",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "عقاراتي",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              Builder(builder: (_) {
                if (_isLoadingBuilding) {
                  return const IsLoadingWidget();
                } else if (_myBuildings.isEmpty) {
                  return const SizedBox(
                    height: 260,
                    child: Center(
                      child: Text(
                        "لا يوجد عقارات مميزة",
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
                } else if (_myBuildings.isNotEmpty) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    itemCount: _myBuildings.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      final building = _myBuildings[index];

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
              }),
            ],
          ),
        ),
      ),
    );
  }
}
