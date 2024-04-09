import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';

class cardSp extends StatelessWidget {
  final String name;
  final String urlOfImg;

  const cardSp({
    super.key,
    required this.name,
    required this.urlOfImg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 90,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 1, // Blur radius
              offset: Offset(0, 2), // Offset in x and y directions
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(urlOfImg),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
