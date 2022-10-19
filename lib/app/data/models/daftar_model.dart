import 'dart:convert';

DaftarModel daftarModelFromJson(String str) =>
    DaftarModel.fromJson(json.decode(str));

String daftarModelToJson(DaftarModel data) => json.encode(data.toJson());

class DaftarModel {
  DaftarModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DaftarModel.fromJson(Map<String, dynamic> json) => DaftarModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
