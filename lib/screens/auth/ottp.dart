import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/componets/appColors.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            SvgPicture.asset("assets/img/My password-pana 1.svg"),
            SizedBox(
              height: 15,
            ),
            Text(
              'التحقق من رقمك',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 32,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'ادخل رمز التحقق المرسل الى رقم الهاتف\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '07746140233 ',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0x49D3D3D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0x49D3D3D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0x49D3D3D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0x49D3D3D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 17.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'اعادة ارسال الرمز   1:17',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // verify the code sended
                },
                child: Container(
                  width: 370,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 46, vertical: 16),
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
                        'التحقق',
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
      )),
    );
  }
}
