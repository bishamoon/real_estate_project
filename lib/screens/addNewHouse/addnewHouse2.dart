import 'package:flutter/material.dart';
import 'package:real_estate/screens/addNewHouse/addNewHouse3.dart';

import '../../componets/appColors.dart';
import '../../componets/widgets/defaultTextField.dart';

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
  TextEditingController _controllerImg1 =
      TextEditingController(text: "https://i.im.ge/2024/06/02/K0MeYC.d2.png");
  TextEditingController _controllerImg2 = TextEditingController(
      text: "https://i.im.ge/2024/06/02/K07iPm.backiee-227050-landscape.jpeg");
  TextEditingController _controllerImg3 =
      TextEditingController(text: "https://i.im.ge/2024/06/02/K0MeYC.d2.png");

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
          img1: _controllerImg1.text,
          img2: _controllerImg2.text,
          img3: _controllerImg3.text,
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
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
                    SizedBox(
                      width: 70,
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
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "صورة 1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              defaultTextField(
                hintText: "قم بأضافة رابط الصورة",
                controller: _controllerImg1,
                validator: (p0) {},
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "صورة 2",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              defaultTextField(
                hintText: "قم بأضافة رابط الصورة",
                controller: _controllerImg2,
                validator: (p0) {},
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "صورة 3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              defaultTextField(
                hintText: "قم بأضافة رابط الصورة",
                controller: _controllerImg3,
                validator: (p0) {},
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
