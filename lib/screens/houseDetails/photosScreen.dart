import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List UrlPhoto = [
    "assets/img/d1.png",
    "assets/img/d2.png",
    "assets/img/d3.png",
    "assets/img/d1.png",
    "assets/img/d2.png",
    "assets/img/d3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "عرض الصور",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // show alll imgs
                    },
                    child: Row(
                      children: [
                        Text(
                          "عرض المزيد",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            height: 0,
                          ),
                        ),
                        Image.asset("assets/img/arrow-back.png")
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0, // Adjust the vertical spacing
                  crossAxisSpacing: 0.0, // Adjust the horizontal spacing
                ),
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return photoConatiner(
                    UrlPhoto: UrlPhoto[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 380,
        height: 88,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 140,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(44),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "اتصل الان",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "السعر الكامل",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    Text(
                      "600,000,000 IQD",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class photoConatiner extends StatelessWidget {
  const photoConatiner({
    super.key,
    this.UrlPhoto,
  });
  final UrlPhoto;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      height: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Image.asset(UrlPhoto),
    );
  }
}
