// Model for your types
class TypeModel {
  final String code;
  final List<Data> data;
  final bool success;
  final String message;

  TypeModel({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      code: json['code'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      success: json['success'],
      message: json['message'],
    );
  }
}

// Model for your data
class Data {
  final int id;
  final String name;

  Data({required this.id, required this.name});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
    );
  }
}
