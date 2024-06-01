import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import '../../componets/widgets/inputDetails.dart';
import '../../models/building_model.dart';
import '../../network/end_points.dart';
import '../../network/http_helper.dart';
import 'addNewHouse.dart';
import 'addnewHouse2.dart';

class AddNewHouse3 extends StatefulWidget {
  const AddNewHouse3(
      {super.key,
      this.name,
      this.description,
      this.cost,
      this.area,
      this.selectedIndexNames,
      this.selectedIndexState,
      this.mapUrl,
      this.img1,
      this.img2,
      this.img3});

  final String? name;
  final String? description;
  final int? cost;
  final int? area;
  final int? selectedIndexNames;
  final int? selectedIndexState;
  final String? mapUrl;
  final String? img1;
  final String? img2;
  final String? img3;

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
      TextEditingController(text: "113231231");
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

  void _showPublishMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('تم النشر',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          )),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  postNewBuilding() async {
    try {
      String type;
      switch (widget.selectedIndexNames) {
        case 0:
          type = "شقة";
          break;
        case 1:
          type = "بيت";
          break;
        case 2:
          type = "مكتب";
          break;
        case 3:
          type = "متجر";
          break;
        case 4:
          type = "بناية";
          break;
        case 5:
          type = "ارض";
          break;
        default:
          type = "OtherType";
      }

      String? tileType;
      switch (_selectedItem) {
        case 'سيراميك':
          tileType = 'سيراميك';
          break;
        case 'جرانيت':
          tileType = 'جرانيت';
          break;
        case 'رخام':
          tileType = 'رخام';
          break;
        case 'موكيت':
          tileType = 'موكيت';
          break;
        case 'بورسلين':
          tileType = 'بورسلين';
          break;
        case 'باركيه':
          tileType = 'باركيه';
          break;
        default:
          tileType = 'OtherType';
      }

      var body = {
        "name": "name",
        "cost": widget.cost ?? 0,
        "description": widget.description ?? "",
        "phoneNumber": int.parse(_controllerPhoneNumber.text),
        "numberRooms": _countBedRoom,
        "numberServers": _countBath,
        "numberFloors": _countFloor,
        "age": int.parse(_controllerAgeHouse.text),
        "nzal": 0,
        "HotKatchen": _isKitchenHot,
        "pool": _isPool,
        "laundryRoom": _isWashingRoom,
        "gardenArea": int.parse(_controllerGradenArea.text),
        "garageArea": int.parse(_controllerGarage.text),
        "photos": [widget.img1, widget.img2, widget.img2],
        "area": widget.area ?? 0,
        "map": widget.mapUrl ?? "",
        "type": type,
        "tileType": tileType,
        "status": widget.selectedIndexState == 0 ? "sell" : "rent",
        "town": _controllerTown.text,
        "katchenNumber": _countKitchenRoom,
      };

      body.forEach((key, value) {
        print('$key: $value');
      });

      final response = await HttpHelper.postData(
        url: EndPoints.addNewHouse,
        body: body,
      );

      print(response);

      if (response['success']) {
        // Handle success
      } else {
        print("error $response");
      }
    } catch (error) {
      print('Caught error: $error');
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
            choose("مطبخ ساخن", _isKitchenHot, () {
              _isKitchenHot = true;
              setState(() {});
            }, () {
              _isKitchenHot = false;
              setState(() {});
            }),
            SizedBox(
              height: 10,
            ),
            choose("مسبح", _isPool, () {
              _isPool = true;
              setState(() {});
            }, () {
              _isPool = false;
              setState(() {});
            }),
            SizedBox(
              height: 10,
            ),
            choose("غرفة غسيل", _isWashingRoom, () {
              _isWashingRoom = true;
              setState(() {});
            }, () {
              _isWashingRoom = false;
              setState(() {});
            }),
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
                      postNewBuilding();
                      print("ok");
                      //show message
                      _showPublishMessage(context);
                      Navigator.pushNamed(context, "/dashBoard");
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

  Container choose(
      String lable, bool value, Function()? onTap1, Function()? onTap2) {
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
                onTap: onTap1,
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
                onTap: onTap2,
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
