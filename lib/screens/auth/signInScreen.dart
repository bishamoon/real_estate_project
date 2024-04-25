import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import '../../componets/appColors.dart';
import '../../componets/widgets/defaultTextField.dart';
import "package:http/http.dart" as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;

  signIn() async {
    try {
      final response =
          await HttpHelper.postData(url: EndPoints.signInUrl, body: {
        "phoneNumber": _phoneNumberController.text,
        "password": _password.text,
      });
      print("response = $response");
    } catch (e) {
      print("error in sign in = $e");
    }
  }

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
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 18, top: 14),
                  child: Text(
                    'Real Estate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 26,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Text(
                    "قم بالتسجيل , ابحث عن منزل احلامك",
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 27,
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
                defaultTextField(
                  obscureText: _obscureText,
                  controller: _password,
                  hintText: "كلمة المرور",
                  validator: (p0) {},
                  onChanged: (p0) {},
                  maxLines: 1,
                  minLines: 1,
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 3, left: 3),
                    child: Transform.translate(
                      offset: const Offset(3, 4),
                      child: SvgPicture.asset(
                        "assets/img/password.6 1.svg",
                        width: 25,
                        height: 28,
                      ),
                    ),
                  ),
                  suffix: Transform.translate(
                    offset: const Offset(3, 3),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        "assets/img/eye.svg",
                        width: 27,
                        height: 26,
                      ),
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
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
                      setState(() {
                        signIn();
                      });
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
                            'تسجيل الدخول',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
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
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      'هل نسيت كلمة  السر؟',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/ForgetPassword");
                    },
                  ),
                ),
                SizedBox(
                  height: 160,
                ),
                Center(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('ليس لديك حساب؟',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/SignUpScreen");
                          },
                          child: Text(
                            'انشاء حساب',
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 15,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
