// ignore_for_file: public_member_api_docs, sort_constructors_first
class BuildingModel {
  final String code;
  final List<DataBuildingModel> data;
  final bool success;
  final String message;
  BuildingModel({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
        code: json['code'],
        data: List<DataBuildingModel>.from(
            json['data'].map((x) => DataBuildingModel.fromJson(x))),
        success: json['success'],
        message: json['message'],
      );
}

class DataBuildingModel {
  final String id;
  final String userId;
  final String name;
  final String date;
  final int cost;
  final String description;
  final int phoneNumber;
  final bool isAvailable;
  final int tileTypeId;
  final int statusId;
  final int typeBuildId;
  final User user;
  final BuildingInfo buildingInfo;
  final TileType tileType;
  final TileType status;
  final TileType typeBuild;

  DataBuildingModel(
      {required this.id,
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
      required this.typeBuild});

  factory DataBuildingModel.fromJson(Map<String, dynamic> json) =>
      DataBuildingModel(
        id: json['id'],
        userId: json['userId'],
        name: json['name'],
        date: json['date'],
        cost: json['cost'],
        description: json['description'],
        phoneNumber: json['phoneNumber'],
        isAvailable: json['isAvailable'],
        tileTypeId: json['tileTypeId'],
        statusId: json['statusId'],
        typeBuildId: json['typeBuildId'],
        user: User.fromJson(json['user']),
        buildingInfo: BuildingInfo.fromJson(json['buildingInfo']),
        tileType: TileType.fromJson(json['tileType']),
        status: TileType.fromJson(json['status']),
        typeBuild: TileType.fromJson(json['typeBuild']),
      );
}

class User {
  final String id;
  final String email;
  final String name;
  final String password;
  final String roleId;
  final String address;
  final String settingId;
  final String createdAt;
  final String updatedAt;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.roleId,
      required this.address,
      required this.settingId,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        password: json['password'],
        roleId: json['roleId'],
        address: json['address'],
        settingId: json['settingId'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
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

  BuildingInfo(
      this.id,
      this.numberRooms,
      this.numberServers,
      this.numberFloors,
      this.age,
      this.nzal,
      this.hotKatchen,
      this.katchenNumber,
      this.pool,
      this.laundryRoom,
      this.gardenArea,
      this.garageArea,
      this.photos,
      this.area,
      this.map,
      this.town,
      this.buildingInfoId);

  factory BuildingInfo.fromJson(Map<String, dynamic> json) => BuildingInfo(
        json['id'],
        json['numberRooms'],
        json['numberServers'],
        json['numberFloors'],
        json['age'],
        json['nzal'],
        json['hotKatchen'],
        json['katchenNumber'],
        json['pool'],
        json['laundryRoom'],
        json['gardenArea'],
        json['garageArea'],
        List<String>.from(json['photos'].map((x) => x)),
        json['area'],
        json['map'],
        json['town'],
        json['buildingInfoId'],
      );
}

class TileType {
  final int id;
  final String name;

  TileType({required this.id, required this.name});

  factory TileType.fromJson(Map<String, dynamic> json) => TileType(
        id: json['id'],
        name: json['name'],
      );
}
