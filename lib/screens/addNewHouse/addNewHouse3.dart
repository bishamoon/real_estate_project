import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/componets/appColors.dart';

import '../../componets/widgets/inputDetails.dart';
import '../../models/building_model.dart';
import '../../network/end_points.dart';
import '../../network/http_helper.dart';
import 'addNewHouse.dart';
import 'addnewHouse2.dart';

class AddNewHouse3 extends StatefulWidget {
  const AddNewHouse3({super.key});

  @override
  State<AddNewHouse3> createState() => _AddNewHouse3State();
}

class _AddNewHouse3State extends State<AddNewHouse3> {
  List<String> _items = [
    'سيراميك',
    'جرانيت',
    'رخام',
    'موكيت',
    'بورسلين',
    'باركيه'
  ];
  String? _selectedItem;

  TextEditingController _controllerGradenArea =
      TextEditingController(text: "200");
  TextEditingController _controllerGarage = TextEditingController(text: "300");
  TextEditingController _controllerAgeHouse =
      TextEditingController(text: "400");
  TextEditingController _controllerPhoneNumber =
      TextEditingController(text: "07742345632");
  TextEditingController _controllerTown = TextEditingController(text: "twon");
  int _countBedRoom = 0;
  int _countKitchenRoom = 0;
  int _countBath = 0;
  int _countFloor = 0;

  bool _isKitchenHot = false;
  bool _isPool = false;
  bool _isWashingRoom = false;

  void _incrementBedRoom() {
    setState(() {
      _countBedRoom++;
    });
  }

  void _decrementBedRoom() {
    setState(() {
      if (_countBedRoom > 0) {
        _countBedRoom--;
      }
    });
  }

  void _incrementKitchen() {
    setState(() {
      _countKitchenRoom++;
    });
  }

  void _decrementKitchen() {
    setState(() {
      if (_countKitchenRoom > 0) {
        _countKitchenRoom--;
      }
    });
  }

  void _incrementBath() {
    setState(() {
      _countBath++;
    });
  }

  void _decrementBath() {
    setState(() {
      if (_countBath > 0) {
        _countBath--;
      }
    });
  }

  void _incrementFloor() {
    setState(() {
      _countFloor++;
    });
  }

  void _decrementFloor() {
    setState(() {
      if (_countFloor > 0) {
        _countFloor--;
      }
    });
  }

  BuildingModel? _building;
  AddNewHouse? addNewHouse1;
  AddNewHouse2? addNewHouse2;

  Future<void> postNewBuilding(BuildContext ctx) async {
    try {
      final response = await HttpHelper.postData(
        url: EndPoints.addNewHouse,
        body: {
          "name": addNewHouse1?.nameController.text,
          "cost": int.parse(addNewHouse1?.costController.text ?? "0"),
          "description": addNewHouse1?.desController.text,
          "phoneNumber": int.parse(_controllerPhoneNumber.text),
          "numberRooms": _countBedRoom,
          "numberServers": _countBath,
          "numberFloors": _countFloor,
          "age": int.parse(_controllerAgeHouse.text),
          "nzal": 30,
          "HotKatchen": true,
          "pool": true,
          "laundryRoom": true,
          "gardenArea": int.parse(_controllerGradenArea.text),
          "garageArea": int.parse(_controllerGarage.text),
          "photos": ["QWeqwe"],
          "area": int.parse(addNewHouse1?.areaController.text ?? "0"),
          "map": addNewHouse2?.mapController.text,
          // "type": addNewHouse1?.selectedIndexNames,
          // "tileType": _selectedItem,
          // "status": addNewHouse1?.selectedIndexState,
          "type": "بيت",
          "status": "rent",
          "tileType": "سيراميك",
          "town": _controllerTown.text,
          "katchenNumber": _countKitchenRoom,
        },
        /*  body: {
            "name": "x c",
            "cost": 1231,
            "description": "asdasdasd",
            "phoneNumber": 113231231,
            "numberRooms": 12,
            "numberServers": 3,
            "numberFloors": 3,
            "age": 5,
            "nzal": 31,
            "HotKatchen": true,
            "pool": true,
            "laundryRoom": true,
            "gardenArea": 23142,
            "garageArea": 2342,
            "photos": ["QWeqwe"],
            "area": -12312,
            "map": "qweqwe",
            "type": "بناية",
            "tileType": "بورسلين",
            "status": "rent",
            "town": "asdasD",
            "katchenNumber": 3
          } */
      );
      print(response);
      if (response['success']) {
        // _building = BuildingModel.fromJson(response);
      } else {
        print("error $response");
      }
    } catch (error) {
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 30,
            ),
            Center(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "أوشكت على الانتهاء , اكمل المعلومات",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        alignment: Alignment.center,
                        color: Colors.white,
                        icon: Icon(Icons.remove),
                        onPressed: _decrementBedRoom,
                      ),
                    ),
                  ),
                  Text(
                    '$_countBedRoom',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        color: Colors.white,
                        icon: Icon(Icons.add),
                        onPressed: _incrementBedRoom,
                      ),
                    ),
                  ),
                  Text(
                    'غرف النوم',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        alignment: Alignment.center,
                        color: Colors.white,
                        icon: Icon(Icons.remove),
                        onPressed: _decrementKitchen,
                      ),
                    ),
                  ),
                  Text(
                    '$_countKitchenRoom',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        color: Colors.white,
                        icon: Icon(Icons.add),
                        onPressed: _incrementKitchen,
                      ),
                    ),
                  ),
                  Text(
                    'عدد المطابخ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        alignment: Alignment.center,
                        color: Colors.white,
                        icon: Icon(Icons.remove),
                        onPressed: _decrementBath,
                      ),
                    ),
                  ),
                  Text(
                    '$_countBath',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        color: Colors.white,
                        icon: Icon(Icons.add),
                        onPressed: _incrementBath,
                      ),
                    ),
                  ),
                  Text(
                    'الخدمات',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        alignment: Alignment.center,
                        color: Colors.white,
                        icon: Icon(Icons.remove),
                        onPressed: _decrementFloor,
                      ),
                    ),
                  ),
                  Text(
                    '$_countFloor',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 1),
                        color: Colors.white,
                        icon: Icon(Icons.add),
                        onPressed: _incrementFloor,
                      ),
                    ),
                  ),
                  Text(
                    'الطوابق',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            InputDetails(
              labelText: "مساحة الحديقة",
              hintText: "50",
              controller: _controllerGradenArea,
            ),
            InputDetails(
              labelText: "اسم المدينة",
              hintText: "بغداد",
              controller: _controllerTown,
            ),
            InputDetails(
              labelText: "مساحة الكراج",
              hintText: "50",
              controller: _controllerGarage,
            ),
            InputDetails(
              labelText: "عمر العقار  سنة",
              hintText: "5",
              controller: _controllerAgeHouse,
            ),
            choose("مطبخ ساخن", _isKitchenHot),
            SizedBox(
              height: 10,
            ),
            choose("مسبح", _isPool),
            SizedBox(
              height: 10,
            ),
            choose("غرفة غسيل", _isWashingRoom),
            SizedBox(
              height: 11,
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
                  DropdownButton<String>(
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                    items: _items.map((String item) {
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
                  Text(
                    'نوع البلاط',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            InputDetails(
              labelText: "رقم الهاتف",
              hintText: "07xxxxxxxxx",
              controller: _controllerPhoneNumber,
              type: TextInputType.numberWithOptions(),
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
                      postNewBuilding(context);
                      print("ok");
                      Navigator.pushNamed(context, "/HomeScreen");

                      print(addNewHouse1?.nameController.text);
                      print(
                          int.parse(addNewHouse1?.costController.text ?? "0"));
                      print(addNewHouse1?.desController.text);
                      print(int.parse(_controllerPhoneNumber.text));
                      print(_countBedRoom);
                      print(_countBath);
                      print("mappp : $addNewHouse2?.mapController.text");
                    },
                    child: Center(
                      child: Text(
                        "نشر",
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
                      Navigator.popAndPushNamed(context, "/AddNewHouse2");
                    },
                    child: Center(
                      child: Text(
                        "رجوع",
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
            SizedBox(
              height: 5,
            ),
          ],
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
                  "يوجد",
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
                  "لايوجد",
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
          Text(
            lable,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
