// To parse this JSON data, do
//
//     final buildingDetails = buildingDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BuildingDetails buildingDetailsFromJson(String str) => BuildingDetails.fromJson(json.decode(str));

String buildingDetailsToJson(BuildingDetails data) => json.encode(data.toJson());

class BuildingDetails {
    final String code;
    final BuildingDetailsData data;
    final bool success;
    final String message;

    BuildingDetails({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    factory BuildingDetails.fromJson(Map<String, dynamic> json) => BuildingDetails(
        code: json["code"],
        data: BuildingDetailsData.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "success": success,
        "message": message,
    };
}

class BuildingDetailsData {
    final String id;
    final String userId;
    final String name;
    final DateTime date;
    final int cost;
    final String description;
    final int phoneNumber;
    final bool isAvailable;
    final int tileTypeId;
    final int statusId;
    final int typeBuildId;
    final User user;
    final BuildingInfo buildingInfo;
    final Status tileType;
    final Status status;
    final Status typeBuild;

    BuildingDetailsData({
        required this.id,
        required this.userId,
        required this.name,
        required this.date,
        required this.cost,
        required this.description,
        required this.phoneNumber,
        required this.isAvailable,
        required this.tileTypeId,
        required this.statusId,
        required this.typeBuildId,
        required this.user,
        required this.buildingInfo,
        required this.tileType,
        required this.status,
        required this.typeBuild,
    });

    factory BuildingDetailsData.fromJson(Map<String, dynamic> json) => BuildingDetailsData(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        date: DateTime.parse(json["date"]),
        cost: json["cost"],
        description: json["description"],
        phoneNumber: json["phoneNumber"],
        isAvailable: json["isAvailable"],
        tileTypeId: json["tileTypeId"],
        statusId: json["statusId"],
        typeBuildId: json["typeBuildId"],
        user: User.fromJson(json["user"]),
        buildingInfo: BuildingInfo.fromJson(json["buildingInfo"]),
        tileType: Status.fromJson(json["tileType"]),
        status: Status.fromJson(json["status"]),
        typeBuild: Status.fromJson(json["typeBuild"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "date": date.toIso8601String(),
        "cost": cost,
        "description": description,
        "phoneNumber": phoneNumber,
        "isAvailable": isAvailable,
        "tileTypeId": tileTypeId,
        "statusId": statusId,
        "typeBuildId": typeBuildId,
        "user": user.toJson(),
        "buildingInfo": buildingInfo.toJson(),
        "tileType": tileType.toJson(),
        "status": status.toJson(),
        "typeBuild": typeBuild.toJson(),
    };
}

class BuildingInfo {
    final int id;
    final int numberRooms;
    final int numberServers;
    final int numberFloors;
    final int age;
    final int nzal;
    final bool hotKatchen;
    final int katchenNumber;
    final bool pool;
    final bool laundryRoom;
    final int gardenArea;
    final int garageArea;
    final List<String> photos;
    final int area;
    final String map;
    final String town;
    final String buildingInfoId;

    BuildingInfo({
        required this.id,
        required this.numberRooms,
        required this.numberServers,
        required this.numberFloors,
        required this.age,
        required this.nzal,
        required this.hotKatchen,
        required this.katchenNumber,
        required this.pool,
        required this.laundryRoom,
        required this.gardenArea,
        required this.garageArea,
        required this.photos,
        required this.area,
        required this.map,
        required this.town,
        required this.buildingInfoId,
    });

    factory BuildingInfo.fromJson(Map<String, dynamic> json) => BuildingInfo(
        id: json["id"],
        numberRooms: json["numberRooms"],
        numberServers: json["numberServers"],
        numberFloors: json["numberFloors"],
        age: json["age"],
        nzal: json["nzal"],
        hotKatchen: json["HotKatchen"],
        katchenNumber: json["katchenNumber"],
        pool: json["pool"],
        laundryRoom: json["laundryRoom"],
        gardenArea: json["gardenArea"],
        garageArea: json["garageArea"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        area: json["area"],
        map: json["map"],
        town: json["town"],
        buildingInfoId: json["buildingInfoId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "numberRooms": numberRooms,
        "numberServers": numberServers,
        "numberFloors": numberFloors,
        "age": age,
        "nzal": nzal,
        "HotKatchen": hotKatchen,
        "katchenNumber": katchenNumber,
        "pool": pool,
        "laundryRoom": laundryRoom,
        "gardenArea": gardenArea,
        "garageArea": garageArea,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "area": area,
        "map": map,
        "town": town,
        "buildingInfoId": buildingInfoId,
    };
}

class Status {
    final int id;
    final String name;

    Status({
        required this.id,
        required this.name,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class User {
    final String id;
    final String email;
    final String name;
    final String password;
    final String roleId;
    final String address;
    final String settingId;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic otpId;

    User({
        required this.id,
        required this.email,
        required this.name,
        required this.password,
        required this.roleId,
        required this.address,
        required this.settingId,
        required this.createdAt,
        required this.updatedAt,
        required this.otpId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        roleId: json["roleId"],
        address: json["address"],
        settingId: json["settingId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        otpId: json["otpId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "password": password,
        "roleId": roleId,
        "address": address,
        "settingId": settingId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "otpId": otpId,
    };
}
