import 'package:flutter/material.dart';
import '../componets/appColors.dart';
import '../componets/widgets/customNavBar.dart';
import '../componets/widgets/nearbyCard2.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favoriteItems = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconBackgroundColor),
                    child: Image.asset("assets/img/Trash.png")),
                onTap: () {
                  // Show confirmation dialog when delete button is tapped
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'حذف المفضلة؟',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 20,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: Text(
                          "هل أنت متأكد أنك تريد حذف كافة المفضلة؟",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'لا',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('نعم',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w700,
                                )),
                            onPressed: () {
                              setState(() {
                                favoriteItems.clear();
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
          title: Center(
            child: Text(
              'المفضلة',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 26,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          leading: SizedBox(
            width: 11,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SizedBox(
              width: 400,
              height: 800,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: favoriteItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(favoriteItems[index]), // Use unique key
                    direction: DismissDirection.endToStart,
                    background: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Image.asset("assets/img/Trash.png"),
                          )),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        favoriteItems.removeAt(index); // Remove item from list
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 7),
                      child: nearByCard2(
                        houseName: 'منزل افتراضي',
                        area: 150,
                        imgUrl: "assets/img/houseimg.png",
                        location: 'بغداد , المنصور',
                        price: 1140,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
          bottomNavigationBar: CustomBottomNavigationBar(context: context),
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
         )

        );
  }
}

