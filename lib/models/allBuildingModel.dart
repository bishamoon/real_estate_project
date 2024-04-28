class AllBuildingModel {
    final String code;
    final List<Datum> data;
    final bool success;
    final String message;

    AllBuildingModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    factory AllBuildingModel.fromJson(Map<String, dynamic> json) => AllBuildingModel(
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
    final BuildingInfo buildingInfo;
    final Status tileType;
    final Status status;
    final Status typeBuild;

    Datum({
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
        required this.buildingInfo,
        required this.tileType,
        required this.status,
        required this.typeBuild,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    final bool katchen;
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
        required this.katchen,
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
        katchen: json["katchen"],
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
        "katchen": katchen,
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
