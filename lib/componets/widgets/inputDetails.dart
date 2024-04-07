import 'package:flutter/material.dart';
import '../appColors.dart';

class InputDetails extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType? type;
  const InputDetails({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
     this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 370,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.iconBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 175,
              height: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.white,
              ),
              child: TextField(
                keyboardType: type,
                controller: controller, // Use the provided controller
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText ?? "", // Use hintText parameter
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Cairo',
                    fontSize: 14,
                  ),
                ),
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              labelText ?? "", // Use labelText parameter
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
