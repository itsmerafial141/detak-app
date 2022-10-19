// To parse this JSON data, do
//
//     final answerModel = answerModelFromJson(jsonString);

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
    required this.hasilSadari,
    required this.keterangan,
    required this.totalScore,
    required this.idSadari,
  });

  String hasilSadari;
  String keterangan;
  int totalScore;
  int idSadari;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hasilSadari: json["HASIL_SADARI"],
        keterangan: json["KETERANGAN"],
        totalScore: json["TOTAL_SCORE"],
        idSadari: json["ID_SADARI"],
      );

  Map<String, dynamic> toJson() => {
        "HASIL_SADARI": hasilSadari,
        "KETERANGAN": keterangan,
        "TOTAL_SCORE": totalScore,
        "ID_SADARI": idSadari,
      };
}
