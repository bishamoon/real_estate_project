import 'package:flutter/material.dart';

import '../../componets/appColors.dart';
import '../../componets/widgets/defaultTextField.dart';
import '../../models/user_model.dart';
import '../../network/end_points.dart';
import '../../network/http_helper.dart';
import '../../network/shared_helper.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();

  bool _isLoadingAccount = false;
  @override
  void initState() {
    // TODO: implement initState
    getMyAccount();
    super.initState();
  }

  bool _isLoading = false;
  UserModelData? _user;
  getMyAccount() async {
    setState(() {
      _isLoadingAccount = true;
    });
    final id = await SharedHelper.getData(key: "user_id");
    final response =
        await HttpHelper.getData(url: "${EndPoints.getUserById}/$id");
    if (response['success']) {
      final UserModel data = UserModel.fromJson(response);
      _user = data.data;
    } else {
      _isLoadingAccount = false;
      print("errror = ${response['message']}");
    }
    _isLoadingAccount = false;
    setState(() {});
  }

  //didn't work though ...
  updateAccount() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final id = await SharedHelper.getData(key: "user_id");

      final response = await HttpHelper.updateData(
          url: "${EndPoints.updateUser}/$id",
          body: {
            "name": _controllerName.text,
            "email": _controllerEmail.text,
            "password": _controllerpassword.text,
          });

      if (response["success"]) {
        final data = UserModel.fromJson(response);

        await SharedHelper.saveData(key: "user_name", value: data.data.name);
        await SharedHelper.saveData(key: "user_id", value: data.data.id);
        await SharedHelper.saveData(
            key: "user_password", value: data.data.password);

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
      print("error in update account = $e");
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
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/img/ep_arrow-left-bold.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        //save editing
                        setState(() {
                          updateAccount();
                        });
                      },
                      child: Image.asset("assets/img/ok.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50, // Adjust the size of the circle as needed
                      backgroundColor:
                          Colors.grey, // Background color of the circle
                      backgroundImage: AssetImage(
                          'assets/img/imgprofile.png'), // Image to be displayed inside the circle
                      // You can also use NetworkImage for images from the internet: NetworkImage('url_of_image')
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _isLoadingAccount
                          ? "جاري التحميل..."
                          : _user?.name ?? "زائر",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المعلومات الشخصية",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الاسم",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              defaultTextField(
                hintText: _isLoadingAccount
                    ? "جاري التحميل..."
                    : _user?.name ?? "زائر",
                controller: _controllerName,
                validator: (p0) {},
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "البريد الالكتروني",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              defaultTextField(
                  hintText: _isLoadingAccount
                      ? "جاري التحميل..."
                      : _user?.email ?? "زائر",
                  controller: _controllerEmail,
                  validator: (p0) {},
                  keyboardType: TextInputType.emailAddress),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الرمز السري",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              defaultTextField(
                  hintText: "********",
                  controller: _controllerpassword,
                  validator: (p0) {},
                  keyboardType: TextInputType.visiblePassword),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 150,
                height: 52,
                decoration: ShapeDecoration(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/SignInScreen', (Route<dynamic> route) => false);
                    SharedHelper.removeData(key: "token");
                    SharedHelper.removeData(key: "user_id");
                  },
                  child: Center(
                    child: Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
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
