// To parse this JSON data, do
//
//     final answerModel = answerModelFromJson(jsonString);

// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

AnswerModel answerModelFromJson(String str) =>
    AnswerModel.fromJson(json.decode(str));

String answerModelToJson(AnswerModel data) => json.encode(data.toJson());

class AnswerModel {
  AnswerModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
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
    required this.idSadari,
  });

  var idSadari;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idSadari: json["ID_SADARI"],
      );

  Map<String, dynamic> toJson() => {
        "ID_SADARI": idSadari,
      };
}
