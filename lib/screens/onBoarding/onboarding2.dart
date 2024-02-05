import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/componets/appColors.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
  //  Size screenSize = MediaQuery.of(context).size;
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
            top: 140,
            left: 50,
            child: SizedBox(
              child: SvgPicture.asset(
                "assets/img/Events-rafiki 1.svg",
              ),
            )),
        Positioned(
            left: 66,
            top: 460,
            child: SizedBox(
              child: const Text(
                'ابحث عن منزلك بسهولة',
                style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo',
                    color: AppColors.secondaryColor),
              ),
            )),
        Positioned(
          left: 55,
          top: 510,
          child: SizedBox(
            child: Text(
                'اكتشف أهم خمس أولويات لديك سواء كانت السعر  \n او الموقع.',
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
