import 'package:flutter/material.dart';

import '../../componets/appColors.dart';
import '../../componets/widgets/defaultTextField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();

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
                      onTap: () {},
                      child: Image.asset("assets/img/ep_arrow-left-bold.png"),
                    ),
                    GestureDetector(
                      onTap: () {},
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
                      "سارة فلان ",
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
                hintText: "سارة احمد",
                controller: _controllerName,
                validator: (p0) {},
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "رقم الهاتف",
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
                  hintText: "07xxxxxxxxx",
                  controller: _controllerPhoneNumber,
                  validator: (p0) {},
                  keyboardType: TextInputType.numberWithOptions()),
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
                  keyboardType: TextInputType.visiblePassword)
            ],
          ),
        ),
      ),
    );
  }
}
