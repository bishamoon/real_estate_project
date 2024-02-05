import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/componets/appColors.dart';

class OnBoardingAuth extends StatelessWidget {
  const OnBoardingAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
        top: -200,
        left: -70,
        child: Opacity(
          opacity: 0.15,
          child: Container(
            width: 550,
            height: 550,
            decoration: const ShapeDecoration(
              color: AppColors.primaryColor,
              shape: OvalBorder(),
            ),
          ),
        ),
      ),
      const Positioned(
        top: 100,
        left: 84,
        child: SizedBox(
            child: Text("Real Estate",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.24,
                ))),
      ),
      Positioned(
        top: 177,
        left: 10,
        child: SizedBox(
          child: SvgPicture.asset(
            "assets/img/Hidden person-pana 1.svg",
          ),
        ),
      ),
      const Positioned(
        top: 490,
        left: 90,
        child: SizedBox(
            child: Text(
          'جاهز للأستكشاف؟',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 25,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
      Positioned(
        top: 580,
        left: 40,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/SignInScreen");
          },
          child: Container(
            width: 327,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            decoration: ShapeDecoration(
              color: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'سجل الدخول',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
          top: 690,
          left: 110,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/SignUpScreen");
                  },
                  child: Text(
                    'انشاء حساب',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('ليس لديك حساب؟',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ))
    ]));
  }
}
