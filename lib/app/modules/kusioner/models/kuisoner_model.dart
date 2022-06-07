// To parse this JSON data, do
//
//     final kuisonerModel = kuisonerModelFromJson(jsonString);

import 'dart:convert';

KuisonerModel kuisonerModelFromJson(String str) =>
    KuisonerModel.fromJson(json.decode(str));

String kuisonerModelToJson(KuisonerModel data) => json.encode(data.toJson());

class KuisonerModel {
  KuisonerModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory KuisonerModel.fromJson(Map<String, dynamic> json) => KuisonerModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.idQuestion,
    required this.contentQuestion,
  });

  String idQuestion;
  String contentQuestion;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idQuestion: json["ID_QUESTION"],
        contentQuestion: json["CONTENT_QUESTION"],
      );

  Map<String, dynamic> toJson() => {
        "ID_QUESTION": idQuestion,
        "CONTENT_QUESTION": contentQuestion,
      };
}
