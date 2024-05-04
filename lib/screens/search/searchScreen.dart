import 'package:flutter/material.dart';
import 'package:real_estate/models/building_model.dart';

import '../../componets/appColors.dart';
import '../../componets/widgets/defaultsearchField.dart';
import '../../models/typeModel.dart';
import '../../network/end_points.dart';
import '../../network/http_helper.dart';
import 'results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final TextEditingController _costFromController = TextEditingController();
  final TextEditingController _costToController = TextEditingController();
  final TextEditingController _areaFromController = TextEditingController();
  final TextEditingController _areaToController = TextEditingController();

  int selectedIndexNames = 1;
  List<String> estateNames = [
    'شقة',
    'منزل',
    'مكتب',
    'متجر',
    'بناية',
    'ارض',
  ];
  List<String> _places = ['منصور', 'كرادة', 'زيونة', 'الجادرية', 'الاعظمية'];
  String? _selectedItemTown;
  bool _isRent = false;

  final List<DataBuildingModel> _allBuildings = [];
  bool _isLoadingAllBuildings = false;
  bool _isLoadingAllTypes = false;

  Future<void> getAllBuildingsBySearch({
    String? statuss,
    String? typebuild,
    String? tiletype,
  }) async {
    try {
      setState(() {
        _isLoadingAllBuildings = true;
      });

      final response = await HttpHelper.postData(
        url: EndPoints.allBuilding,
        body: {
          'statuss': _isRent,
          'town': _selectedItemTown,
          'costFrom': _costFromController.text,
          'costTo': _costToController.text,
          'areaFrom': _areaFromController,
          'areaTo': _areaToController.text,
          'name': _searchController,
          'typebuild': typebuild,
          'tiletype': tiletype,
        },
      );

      if (response['success']) {
        final model = BuildingModel.fromJson(response['data']);
        _allBuildings.addAll(model.data);
      } else {}
    } catch (error) {
    } finally {
      setState(() {
        _isLoadingAllBuildings = false;
      });
    }
  }

  // List _allTypes = [];

  // getAllTypes() async {
  //   setState(() {
  //     _isLoadingAllTypes = true;
  //   });
  //   final response = await HttpHelper.getData(url: EndPoints.getAllType);
  //   if (response['success']) {
  //     final model = TypeModel.fromJson(response);
  //     _allTypes.addAll(model.data);
  //   }
  //   _isLoadingAllTypes = false;

  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   getAllTypes();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
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
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "نوع العقار",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                width: 370,
                height: 95,
                decoration: BoxDecoration(
                  color: AppColors.iconBackgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        //must use the type list
                        return buildNameContainer(index);
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return buildNameContainer(index + 3);
                      }),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 17.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "السعر",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.iconBackgroundColor),
                width: 370,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _costFromController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '200,000,000 ',
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                                fontSize: 13),
                          ),
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "الى",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _costToController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '500,000,000 ',
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                                fontSize: 13),
                          ),
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 17.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المساحة",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.iconBackgroundColor),
                width: 370,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _areaFromController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '200 ',
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                                fontSize: 13),
                          ),
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "الى",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _areaToController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '500 ',
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                                fontSize: 13),
                          ),
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                width: 370,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'المنطقة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedItemTown,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItemTown = newValue;
                        });
                      },
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                      items: _places.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      hint: Text(
                        'اختر',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                        ),
                      ), // Text to display when no item is selected
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              choose("الحالة", _isRent),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 122,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsScreen(
                                searchResults: _allBuildings, type: "منزل"),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "تطبيق",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 122,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "الغاء",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexNames = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(2),
        width: 95,
        height: 33,
        decoration: BoxDecoration(
          color: selectedIndexNames == index
              ? AppColors.primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Text(
            //must use the type list
            estateNames[index],
            style: TextStyle(
              color: selectedIndexNames == index
                  ? Colors.white
                  : AppColors.secondaryColor,
              fontSize: 15,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Container choose(String lable, bool value) {
    return Container(
      width: 370,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.iconBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            lable,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 100,
            height: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
              color: value ? AppColors.primaryColor : Colors.white,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value = true;
                  });
                },
                child: Text(
                  "بيع",
                  style: TextStyle(
                    color: value ? Colors.white : AppColors.primaryColor,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            height: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
              color: !value ? AppColors.primaryColor : Colors.white,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value = false;
                  });
                },
                child: Text(
                  "أيجار",
                  style: TextStyle(
                    color: !value ? Colors.white : AppColors.primaryColor,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
