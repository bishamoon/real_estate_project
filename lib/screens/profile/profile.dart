import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';

import '../../componets/widgets/nearbyCard.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("الصفحة الشخصية",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/img/edit.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50, // Adjust the size of the circle as needed
                      backgroundColor:
                          Colors.grey, // Background color of the circle
                      backgroundImage: AssetImage(
                          'assets/img/imgprofile.png'), // Image to be displayed inside the circle
                      // You can also use NetworkImage for images from the internet: NetworkImage('url_of_image')
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "سارة فلان ",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "07xxxxxxxxx",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    )
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
                      "عقاراتي",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              /*  Padding(
                padding: const EdgeInsets.only(right: 7),
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: nearByCard(),
                      );
                    },
                  ),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
