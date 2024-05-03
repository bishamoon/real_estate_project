
class UserModel {
    final String code;
    final UserModelData data;
    final bool success;
    final String message;

    UserModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        data: UserModelData.fromJson(json["data"]),
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

class UserModelData {
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
    final Setting setting;
    final Role role;

    UserModelData({
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
        required this.setting,
        required this.role,
    });

    factory UserModelData.fromJson(Map<String, dynamic> json) => UserModelData(
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
        setting: Setting.fromJson(json["setting"]),
        role: Role.fromJson(json["role"]),
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
        "setting": setting.toJson(),
        "role": role.toJson(),
    };
}

class Role {
    final String id;
    final String name;
    final bool isVerify;
    final bool isActive;

    Role({
        required this.id,
        required this.name,
        required this.isVerify,
        required this.isActive,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        isVerify: json["isVerify"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isVerify": isVerify,
        "isActive": isActive,
    };
}

class Setting {
    final String id;
    final String avatar;
    final bool darkmode;
    final String bio;
    final DateTime dob;

    Setting({
        required this.id,
        required this.avatar,
        required this.darkmode,
        required this.bio,
        required this.dob,
    });

    factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json["id"],
        avatar: json["avatar"],
        darkmode: json["darkmode"],
        bio: json["bio"],
        dob: DateTime.parse(json["dob"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "darkmode": darkmode,
        "bio": bio,
        "dob": dob.toIso8601String(),
    };
}
