import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/componets/appColors.dart';

import '../../componets/widgets/defaultTextField.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // Set the background color to transparent
          elevation: 0, // Remove the shadow
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            /*  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, */
            children: [
              Text(
                'بيت الاحلام ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 32,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'هل نسيت كلمة السر؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C0C26),
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'قم بوضع رقم الهاتف وسوف نرسل اليك رسالة تأكيد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 14,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              defaultTextField(
                controller: _phoneNumberController,
                hintText: "رقم الهاتف",
                validator: (p0) {},
                onChanged: (p0) {},
                keyboardType: TextInputType.phone,
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 3, left: 3),
                  child: Transform.translate(
                    offset: const Offset(3, 5),
                    child: SvgPicture.asset(
                      "assets/img/call.svg",
                      width: 23,
                      height: 23,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // open the account
                  },
                  child: Container(
                    width: 380,
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 46, vertical: 16),
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
                          'ارسال الرمز',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
