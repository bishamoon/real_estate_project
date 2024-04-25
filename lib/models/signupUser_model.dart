import 'dart:convert';

SignUpUserModel SignUpUserModelFromJson(String str) =>
    SignUpUserModel.fromJson(json.decode(str));

String SignUpUserModelToJson(SignUpUserModel data) =>
    json.encode(data.toJson());

class SignUpUserModel {
  SignUpUserModel({
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.roleName,
    this.avatar,
    this.bio,
    required this.town,
  });

  String phoneNumber;
  String password;
  String name;
  String roleName;
  String? avatar;
  String? bio;
  String town;

  factory SignUpUserModel.fromJson(Map<String, dynamic> json) =>
      SignUpUserModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        name: json["name"],
        roleName: json["roleName"],
        avatar: json["avatar"],
        bio: json["bio"],
        town: json["town"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "name": name,
        "roleName": roleName,
        "avatar": avatar,
        "bio": bio,
        "town": town,
      };
}
