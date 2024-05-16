import 'package:flutter/material.dart';
import 'package:real_estate/screens/addNewHouse/addNewHouse3.dart';

import '../../componets/appColors.dart';

class AddNewHouse2 extends StatefulWidget {
  AddNewHouse2(
      {super.key,
      this.name,
      this.description,
      this.cost,
      this.area,
      this.selectedIndexNames,
      this.selectedIndexState});

  final String? name;
  final String? description;
  final int? cost;
  final int? area;
  final int? selectedIndexNames;
  final int? selectedIndexState;
  @override
  State<AddNewHouse2> createState() => _AddNewHouse2State();
}

class _AddNewHouse2State extends State<AddNewHouse2> {
  TextEditingController mapController = TextEditingController(text: "url");
  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void _navigateToAddNewHouse3() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewHouse3(
          mapUrl: mapController.text,
          name: widget.name,
          cost: widget.cost,
          area: widget.area,
          description: widget.description,
          selectedIndexNames: widget.selectedIndexNames,
          selectedIndexState: widget.selectedIndexState,
        ),
      ),
    );
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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "قم بأضافة موقع العقار",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: mapController,
              decoration: InputDecoration(
                hintText: 'رابط العنوان',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "صور من العقار",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
            Center(
                child: Container(
              width: 122,
              height: 70,
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
                    "+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 380,
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
                      _navigateToAddNewHouse3();
                    },
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
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/AddNewHouse");
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
          ],
        ),
      ),
    );
  }
}
