class BuildingModel {
  final bool success;
  final List<DataBuildingModel> data;

  BuildingModel({
    required this.success,
    required this.data,
  });

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
        success: json["success"],
        data: List<DataBuildingModel>.from(
            json["data"].map((x) => DataBuildingModel.fromJson(x))),
      );
}

class DataBuildingModel {
  final String id;
  final String name;
  final DateTime date;
  final int cost;
  final String description;
  final int phoneNumber;
  final bool isAvailable;
  final int tileTypeId;
  final int statusId;
  final int typeBuildId;
  final BuildingInfo buildingInfo;
  final Status tileType;
  final Status status;
  final Status typeBuild;

  DataBuildingModel({
    required this.id,
    required this.name,
    required this.date,
    required this.cost,
    required this.description,
    required this.phoneNumber,
    required this.isAvailable,
    required this.tileTypeId,
    required this.statusId,
    required this.typeBuildId,
    required this.buildingInfo,
    required this.tileType,
    required this.status,
    required this.typeBuild,
  });

  factory DataBuildingModel.fromJson(Map<String, dynamic> json) =>
      DataBuildingModel(
        id: json["id"],
        name: json["name"],
        date: DateTime.parse(json["date"]),
        cost: json["cost"],
        description: json["description"],
        phoneNumber: json["phoneNumber"],
        isAvailable: json["isAvailable"],
        tileTypeId: json["tileTypeId"],
        statusId: json["statusId"],
        typeBuildId: json["typeBuildId"],
        buildingInfo: BuildingInfo.fromJson(json["buildingInfo"]),
        tileType: Status.fromJson(json["tileType"]),
        status: Status.fromJson(json["status"]),
        typeBuild: Status.fromJson(json["typeBuild"]),
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
