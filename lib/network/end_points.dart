import 'package:real_estate/network/shared_helper.dart';

class EndPoints {
  static const baseUrl = "http://172.20.10.2:5000/admin/";
  // for now this your token you should replace it with ""
  static String token = SharedHelper.getData(key: "token") ?? "";

  static const signInUrl = "auth/signin";
  static const signUpUrl = "auth/signup";
  static const allBuilding = "building/getAllBuilding?size=10";
  static const nearMeBuildings = "building/getNearMe";
  static const buildingsByType = "building/getAlltypeBuild?size=10";
  static const buildingById = "building";
  static const getUserById = "user";
  static const updateUser = "user/";
  static const deleteBuilding = "building/";
  static const getBuildingBySearch = "building/getAllBuildingBySearch?size=10";
  static const getAllType = "info/getAllTypeBuild/?size=10";
  static const addNewHouse = "building/newbuilding";
}
