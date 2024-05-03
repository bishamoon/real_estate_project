import 'package:real_estate/network/shared_helper.dart';

class EndPoints {
  static const baseUrl = "http://192.168.0.183:5000/admin/";
  // for now this your token you should replace it with ""
  static String token = SharedHelper.getData(key: "token");

  static const signInUrl = "auth/signin";
  static const signUpUrl = "auth/signup";
  static const allBuilding = "building/getAllBuilding?size=10";
  static const nearMeBuildings = "building/getNearMe";
  static const buildingsByType = "building/getAlltypeBuild?size=10";
  static const buildingById = "building";
  static const getUserById = "user";
  static const updateUser = "";
}
