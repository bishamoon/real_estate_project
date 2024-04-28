
class SignUpModel {    final int code;
    final Data data;
    final bool success;
    final String message;

    SignUpModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
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

class Data {
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

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
