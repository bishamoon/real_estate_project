import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/onBoarding/onboarding3.dart';
import 'package:real_estate/screens/onBoarding/onboarding1.dart';
import 'package:real_estate/screens/onBoarding/onboarding2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            reverse: true,
            children: [OnBoarding1(), OnBoarding2(), OnBoarding3()],
          ),
          Positioned(
            top: screenSize.height * 0.8, // Adjust the bottom margin as needed
            left: 0.0,
            right: 0.0,
            child: Container(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                textDirection: TextDirection.rtl,
                effect: const ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  dotColor: Color.fromRGBO(228, 229, 231, 1),
                  activeDotColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0, // Adjust the bottom margin as needed
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_controller.page == 2) {
                      setState(() {
                        Navigator.pushNamed(context, "/SignUpScreen");
                      });
                    }
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    width: 122,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
                const SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    "تخطي",
                    style: TextStyle(
                        color: AppColors.gray, // Add a color for visibility
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.gray),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
