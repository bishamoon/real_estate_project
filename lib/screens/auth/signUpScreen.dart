import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/componets/appColors.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import '../../componets/widgets/defaultTextField.dart';
import '../../models/signupUser_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _bioController =
      TextEditingController(text: "bio");
  final _avatar = TextEditingController(text: "asdds");
  final _dob = TextEditingController(text: "2000-10-10");
  final _gender = TextEditingController(text: "male");
  // final _address = TextEditingController(text: "baghdad");
  bool passwordsMatch = true;
  bool _obscureText = false;
  bool _isLoading = false;
  signUp() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final response =
          await HttpHelper.postData(url: EndPoints.signUpUrl, body: {
        "email": _emailController.text,
        "password": _password.text,
        "name": _nameController.text,
        "avatar": _avatar.text,
        "bio": _bioController.text,
        "gender": _gender.text,
        "address": _addressController.text,
        "dob": _dob.text,
      });

      print("response = $response");

      if (response["success"]) {
        final data = SignUpModel.fromJson(
            response); // Parse "data" field from the response

        // Update UI or perform necessary actions with the parsed data

        // Move navigation logic outside if the data is parsed successfully
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/SignInScreen", (route) => false);
        }
      } else {
        showError(response["message"]);
      }
    } catch (e) {
      print("error in sign up = $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'Real estate',
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
                const Padding(
                  padding: EdgeInsets.only(right: 16),
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
                  controller: _nameController,
                  hintText: "الاسم الكامل",
                  validator: (p0) {},
                  onChanged: (p0) {},
                  keyboardType: TextInputType.name,
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 3, left: 3),
                    child: Transform.translate(
                      offset: const Offset(2, 3),
                      child: SvgPicture.asset(
                        "assets/img/profile.2 1.svg",
                        width: 21,
                        height: 21,
                      ),
                    ),
                  ),
                ),
                defaultTextField(
                  controller: _emailController,
                  hintText: "البريد الالكتروني",
                  validator: (p0) {},
                  onChanged: (p0) {},
                  keyboardType: TextInputType.emailAddress,
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
                  controller: _addressController,
                  hintText: "      المدينة",
                  validator: (p0) {},
                  onChanged: (p0) {},
                  keyboardType: TextInputType.name,
                ),
                defaultTextField(
                  obscureText: _obscureText,
                  controller: _password,
                  hintText: "كلمة المرور",
                  validator: (p0) {},
                  onChanged: (p0) {},
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.visiblePassword,
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
                SizedBox(height: 15),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              signUp();
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
                                  'التسجيل',
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
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('لديك حساب بالفعل ؟',
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
                            Navigator.pushNamed(context, "/SignInScreen");
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: AppColors.primaryColor,
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
          )),
    );
  }
}
