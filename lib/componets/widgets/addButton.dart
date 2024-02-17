import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 192, 157, 213),
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 30,
              spreadRadius: 5,
              offset: Offset(0, 0), // Center shadow
            ),
            BoxShadow(
              color: Color.fromARGB(255, 192, 157, 213).withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 15,
              offset: Offset(0, 0), // Center shadow
            ),
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.2),
              blurRadius: 50,
              spreadRadius: 20,
              offset: Offset(0, 0), // Center shadow
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(Icons.add, size: 30, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/HomeScreen');
          },
        ),
      ),
    );
  }
}
