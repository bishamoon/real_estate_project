import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/componets/widgets/defaultsearchField.dart';
import 'package:real_estate/screens/building/apartmentsScreen.dart';
import '../../componets/widgets/card.dart';
import '../../componets/widgets/categoryContainer.dart';
import '../../componets/widgets/customNavBar.dart';
import '../../componets/widgets/nearbyCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

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
                SizedBox(
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
                SizedBox(
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
                    validator: (s) {}),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Container(
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
                SizedBox(
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
                          //go to spaical houses page
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
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Container(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return SpacialCard(
                          houseName: 'منزل افتراضي',
                          area: 150,
                          imgUrl: "assets/img/houseimg.png",
                          location: 'بغداد , المنصور',
                          price: 1140,
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
                          //go to near houses page
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
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return nearByCard();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(context:context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 45),
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            onPressed: () => debugPrint("Add Button pressed"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: GestureDetector(
              child: Image.asset("assets/img/write.png"),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void navigateToCategoryPage(BuildContext context, String categoryText) {
    if (categoryText == "منزل") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ApartmentsScreen()));
    } else if (categoryText == "شقة") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ApartmentsScreen()));
    } else if (categoryText == "بناية") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ApartmentsScreen()));
    } else if (categoryText == "ارض") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ApartmentsScreen()));
    } else if (categoryText == "متجر") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ApartmentsScreen()));
    } else if (categoryText == "مكتب") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ApartmentsScreen()));
    }
  }
}
