import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/componets/appColors.dart';

import '../../componets/widgets/inputDetails.dart';

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

  TextEditingController _controllerGradenArea = TextEditingController();
  TextEditingController _controllerGarage = TextEditingController();
  TextEditingController _controllerAgeHouse = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();

  int _countBedRoom = 0;
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
      if (_countBath > 0) {
        _countBedRoom--;
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
            SizedBox(
              height: 10,
            ),
            InputDetails(
              labelText: "مساحة الكراج",
              hintText: "50",
              controller: _controllerGarage,
            ),
            SizedBox(
              height: 10,
            ),
            InputDetails(
              labelText: "عمر العقار  سنة",
              hintText: "5",
              controller: _controllerAgeHouse,
            ),
            SizedBox(
              height: 10,
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
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "التالي",
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
                    onTap: () {},
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
