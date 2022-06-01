import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.email,
    required this.name,
    required this.nameRole,
    this.profilepicUser,
    required this.phone,
    this.dateBirth,
  });

  String email;
  String name;
  String nameRole;
  dynamic profilepicUser;
  String phone;
  dynamic dateBirth;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["EMAIL"],
        name: json["NAME"],
        nameRole: json["NAME_ROLE"],
        profilepicUser: json["PROFILEPIC_USER"],
        phone: json["PHONE"],
        dateBirth: json["DATE_BIRTH"],
      );

  Map<String, dynamic> toJson() => {
        "EMAIL": email,
        "NAME": name,
        "NAME_ROLE": nameRole,
        "PROFILEPIC_USER": profilepicUser,
        "PHONE": phone,
        "DATE_BIRTH": dateBirth,
      };
}
