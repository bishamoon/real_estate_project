import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/componets/appColors.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        // Half oval
        Positioned(
          top: -250,
          child: Opacity(
            opacity: 0.15,
            child: Container(
              width: 416,
              height: 416,
              decoration: const ShapeDecoration(
                color: AppColors.primaryColor,
                shape: OvalBorder(),
              ),
            ),
          ),
        ),
        Positioned(
            top: 160,
            left: 17,
            child: SizedBox(
              child: SvgPicture.asset(
                "assets/img/Apartment rent-pana 1.svg",
              ),
            )),
        Positioned(
            left: 66,
            top: 460,
            child: SizedBox(
              child: const Text(
                'استعد لاكتشاف منزل\n أحلامك بسهولة ويسر',
                style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo',
                    color: AppColors.secondaryColor),
              ),
            )),
        Positioned(
          left: 55,
          top: 550,
          child: SizedBox(
            child: Text(' اكتشف عالمًا جديدًا من العقارات مع تطبيقنا المبتكر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 14,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
      ]),
    );
  }
}
