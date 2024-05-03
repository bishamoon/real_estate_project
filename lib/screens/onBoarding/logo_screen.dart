import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/screens/homescreen/homeScreen.dart';
import 'package:real_estate/screens/onBoarding/onboarding_screen.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller setup
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    // Opacity animation setup
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Add a listener to the animation
    _animation.addListener(() {
      // Check if the animation is complete (value reaches 1.0)
      if (_animation.value == 1.0) {
        // Call the navigation method
        _navigateToNextScreen();
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                const Positioned(
                  left: 90,
                  top: 368,
                  child: SizedBox(
                    width: 299,
                    height: 63,
                    child: Text(
                      'Real Estate',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 44,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        height: 0,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 115,
                  top: 441,
                  child: SizedBox(
                    width: 209,
                    height: 42,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'ابحث عن منزل ',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'احلامك',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
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
                Positioned(
                  left: -155,
                  bottom: -150,
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
                  left: 128,
                  top: -97,
                  child: Opacity(
                    opacity: 0.15,
                    child: Container(
                      width: 400,
                      height: 407,
                      decoration: const ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -120,
                  bottom: -100,
                  child: Container(
                    width: 316,
                    height: 316,
                    decoration: const ShapeDecoration(
                      color: AppColors.primaryColor,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 188,
                  top: -70,
                  child: Container(
                    width: 316,
                    height: 316,
                    decoration: const ShapeDecoration(
                      color: AppColors.primaryColor,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            onBoardingScreen(), // Replace with your next screen
      ),
    );
  }
}
