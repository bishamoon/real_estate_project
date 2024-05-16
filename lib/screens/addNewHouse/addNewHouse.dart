import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/addNewHouse/addNewHouse3.dart';
import 'package:real_estate/screens/addNewHouse/addnewHouse2.dart';

class AddNewHouse extends StatefulWidget {
  AddNewHouse({super.key});

  @override
  State<AddNewHouse> createState() => _AddNewHouseState();
}

class _AddNewHouseState extends State<AddNewHouse> {
  TextEditingController nameController = TextEditingController(text: "name");
  TextEditingController desController = TextEditingController(text: "des");
  TextEditingController costController = TextEditingController(text: "12");
  TextEditingController areaController = TextEditingController(text: "12");

  List<String> estateNames = [
    'شقة',
    'بيت',
    'مكتب',
    'متجر',
    'بناية',
    'ارض',
  ];

  List<String> estateState = ['بيع', 'ايجار'];
  int selectedIndexNames = 1;
  int selectedIndexState = 0;

  @override
  void dispose() {
    nameController.dispose();
    desController.dispose();
    costController.dispose();
    areaController.dispose();
    super.dispose();
  }

  void _navigateToAddNewHouse3() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewHouse2(
          name: nameController.text,
          description: desController.text,
          cost: int.parse(costController.text),
          area: int.parse(areaController.text),
          selectedIndexNames: selectedIndexNames,
          selectedIndexState: selectedIndexState,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
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
                  "!قم بأضافة عقار جديد",
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
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.iconBackgroundColor),
            width: 360,
            height: 270,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 198,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'اسم العقار',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                                fontSize: 14),
                          ),
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "الاسم",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 198,
                      height: 142.89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: desController,
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove the default border
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10), // Adjust padding as needed
                          hintText: "منزل بأطلالة مميزة",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Cairo',
                              fontSize: 14),
                        ),
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.right,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    const Text(
                      "الوصف",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                ),
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 15,
          ),
          Container(
            width: 370,
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.iconBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: estateState.length,
              itemBuilder: (BuildContext context, int index) {
                return buildStateContainer(index);
              },
            ),
          ),
          SizedBox(
            height: 15,
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
                    width: 174,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: costController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '200,000,000 ',
                        hintTextDirection: TextDirection.ltr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Cairo',
                            fontSize: 14),
                      ),
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    "IQD السعر",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
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
                    width: 174,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: areaController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '200 ',
                        hintTextDirection: TextDirection.ltr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Cairo',
                            fontSize: 14),
                      ),
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    "المساحة م",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Container(
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
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "التالي",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
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

  Widget buildStateContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexState = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(9),
        width: 160,
        height: 28,
        decoration: BoxDecoration(
          color: selectedIndexState == index
              ? AppColors.primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Text(
            estateState[index],
            style: TextStyle(
              color: selectedIndexState == index
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
}
