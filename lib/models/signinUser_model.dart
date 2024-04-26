class SignInModel {
  final int code;
  final Data data;
  final bool success;
  final String message;

  SignInModel({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
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
  final int drIdOrHfId;
  final String id;
  final bool verify;
  final String roleName;
  final String displayName;
  final String accessToken;
  final String renewalToken;
  final String tokenType;

  Data({
    required this.drIdOrHfId,
    required this.id,
    required this.verify,
    required this.roleName,
    required this.displayName,
    required this.accessToken,
    required this.renewalToken,
    required this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        drIdOrHfId: json["drIdOrHfId"],
        id: json["id"],
        verify: json["verify"],
        roleName: json["roleName"],
        displayName: json["displayName"],
        accessToken: json["accessToken"],
        renewalToken: json["renewalToken"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "drIdOrHfId": drIdOrHfId,
        "id": id,
        "verify": verify,
        "roleName": roleName,
        "displayName": displayName,
        "accessToken": accessToken,
        "renewalToken": renewalToken,
        "token_type": tokenType,
      };
}
