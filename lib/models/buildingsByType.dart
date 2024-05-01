// To parse this JSON data, do
//
//     final buildingByType = buildingByTypeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BuildingByType buildingByTypeFromJson(String str) => BuildingByType.fromJson(json.decode(str));

String buildingByTypeToJson(BuildingByType data) => json.encode(data.toJson());

class BuildingByType {
    final String code;
    final List<Datum> data;
    final bool success;
    final String message;

    BuildingByType({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    factory BuildingByType.fromJson(Map<String, dynamic> json) => BuildingByType(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Datum {
    final int id;
    final String name;
    final List<Building> building;

    Datum({
        required this.id,
        required this.name,
        required this.building,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        building: List<Building>.from(json["Building"].map((x) => Building.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "Building": List<dynamic>.from(building.map((x) => x.toJson())),
    };
}

class Building {
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


    Building({
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
    });

    factory Building.fromJson(Map<String, dynamic> json) => Building(
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
    };
}
