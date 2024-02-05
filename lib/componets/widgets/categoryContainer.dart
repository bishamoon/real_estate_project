import 'package:flutter/material.dart';

import '../appColors.dart';

class CategoryContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const CategoryContainer({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 120,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontFamily: "Cairo",
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.pastel,
          ),
        ),
      ),
    );
  }
}
