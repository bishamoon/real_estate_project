import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/models/signinUser_model.dart';
import 'package:real_estate/network/end_points.dart';
import 'package:real_estate/network/http_helper.dart';
import 'package:real_estate/network/shared_helper.dart';
import '../../componets/appColors.dart';
import '../../componets/widgets/defaultTextField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "noorsaadjaba78@gmail.com");
  final TextEditingController _password =
      TextEditingController(text: "123456789");
  bool _obscureText = true;
  bool _isLoading = false;

  signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final response =
          await HttpHelper.postData(url: EndPoints.signInUrl, body: {
        "email": _emailController.text,
        "password": _password.text,
      });

      print("res : $response");

      if (response["success"]) {
        final data = SignInModel.fromJson(response);
        await SharedHelper.saveData(key: "token", value: data.data.accessToken);
        await SharedHelper.saveData(key: "user_id", value: data.data.id);
        if (context.mounted) {
          Navigator.pushNamed(context, "/dashBoard");
        }
        _isLoading = false;
      } else {
        _isLoading = false;
        showError(response["message"]);
      }
    } catch (e) {
      _isLoading = false;
      print("error in sign in = $e");
    }
    setState(() {});
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
          backgroundColor:
              Colors.transparent, // Set the background color to transparent
          elevation: 0, // Remove the shadow
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
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
                const SizedBox(
                  height: 16,
                ),
                const Padding(
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
                const SizedBox(
                  height: 27,
                ),
                defaultTextField(
                  controller: _emailController,
                  hintText: "البريد الالكتروني",
                  validator: (p0) {
                    return null;
                  },
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
                  obscureText: _obscureText,
                  controller: _password,
                  hintText: "كلمة المرور",
                  validator: (p0) {
                    return null;
                  },
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
                const SizedBox(
                  height: 30,
                ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
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
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    child: const Text(
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
                const SizedBox(
                  height: 160,
                ),
                Center(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('ليس لديك حساب؟',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/SignUpScreen");
                          },
                          child: const Text(
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
