// To parse this JSON data, do
//
//     final daftarRiwayatModel = daftarRiwayatModelFromJson(jsonString);

import 'dart:convert';

DaftarRiwayatModel daftarRiwayatModelFromJson(String str) =>
    DaftarRiwayatModel.fromJson(json.decode(str));

String daftarRiwayatModelToJson(DaftarRiwayatModel data) =>
    json.encode(data.toJson());

class DaftarRiwayatModel {
  DaftarRiwayatModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory DaftarRiwayatModel.fromJson(Map<String, dynamic> json) =>
      DaftarRiwayatModel(
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
    required this.idSadari,
    required this.totalScore,
    required this.hasilSadari,
    required this.keterangan,
    required this.dateSadari,
  });

  String idSadari;
  String totalScore;
  String hasilSadari;
  String keterangan;
  DateTime dateSadari;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSadari: json["ID_SADARI"],
        totalScore: json["TOTAL_SCORE"],
        hasilSadari: json["HASIL_SADARI"],
        keterangan: json["KETERANGAN"],
        dateSadari: DateTime.parse(json["DATE_SADARI"]),
      );

  Map<String, dynamic> toJson() => {
        "ID_SADARI": idSadari,
        "TOTAL_SCORE": totalScore,
        "HASIL_SADARI": hasilSadari,
        "KETERANGAN": keterangan,
        "DATE_SADARI": dateSadari.toIso8601String(),
      };
}
