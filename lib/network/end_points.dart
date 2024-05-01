import 'package:real_estate/network/shared_helper.dart';

class EndPoints {
  static const baseUrl = "http://192.168.0.183:5000";
  // for now this your token you should replace it with ""
  static String token = SharedHelper.getData(key: "token") ??
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlTmFtZSI6InN1cGVyYWRtaW4iLCJkaXNwbGF5TmFtZSI6Ink4OXNkYWR5IiwiaWQiOiJmNTQ4NjNmMS1jN2ZhLTRlNmUtOTQ0NS02ZTkwYmFkYjJlNmIiLCJpc1ZlcmlmeSI6ZmFsc2UsImFjY2Vzc1Rva2VuIjoiIiwicmVuZXdhbFRva2VuIjoiIiwidG9rZW5fdHlwZSI6ImJlYXJlciIsImlhdCI6MTcxNDA2MjgzOSwiZXhwIjoxNzE0MDY2NDM5fQ.JKlE-_1aK6A7fD7Qq6z0zE_9j94KKAwfR2JNkmdomU4";

  static const signInUrl = "/admin/auth/signin";
  static const signUpUrl = "/admin/auth/signup";
  static const allBuilding = "/admin/building/getAllBuilding?size=30";
  static const nearMeBuildings = "/admin/building/getNearMe";
  static const buildingsByType = "/admin/building/getAlltypeBuild?size=30";
}
