// To parse this JSON data, do
//
//     final detailRiwayatTestModel = detailRiwayatTestModelFromJson(jsonString);

import 'dart:convert';

DetailRiwayatTestModel detailRiwayatTestModelFromJson(String str) =>
    DetailRiwayatTestModel.fromJson(json.decode(str));

String detailRiwayatTestModelToJson(DetailRiwayatTestModel data) =>
    json.encode(data.toJson());

class DetailRiwayatTestModel {
  DetailRiwayatTestModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory DetailRiwayatTestModel.fromJson(Map<String, dynamic> json) =>
      DetailRiwayatTestModel(
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
    required this.dataSadari,
    required this.dataSadariDetail,
  });

  List<DataSadari> dataSadari;
  List<DataSadariDetail> dataSadariDetail;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataSadari: List<DataSadari>.from(
            json["data_sadari"].map((x) => DataSadari.fromJson(x))),
        dataSadariDetail: List<DataSadariDetail>.from(json["data_sadari_detail"]
            .map((x) => DataSadariDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data_sadari": List<dynamic>.from(dataSadari.map((x) => x.toJson())),
        "data_sadari_detail":
            List<dynamic>.from(dataSadariDetail.map((x) => x.toJson())),
      };
}

class DataSadari {
  DataSadari({
    required this.idSadari,
    required this.email,
    required this.totalScore,
    required this.hasilSadari,
    required this.keterangan,
    required this.dateSadari,
  });

  String idSadari;
  String email;
  String totalScore;
  String hasilSadari;
  String keterangan;
  String dateSadari;

  factory DataSadari.fromJson(Map<String, dynamic> json) => DataSadari(
        idSadari: json["ID_SADARI"],
        email: json["EMAIL"],
        totalScore: json["TOTAL_SCORE"],
        hasilSadari: json["HASIL_SADARI"],
        keterangan: json["KETERANGAN"],
        dateSadari: json["DATE_SADARI"],
      );

  Map<String, dynamic> toJson() => {
        "ID_SADARI": idSadari,
        "EMAIL": email,
        "TOTAL_SCORE": totalScore,
        "HASIL_SADARI": hasilSadari,
        "KETERANGAN": keterangan,
        "DATE_SADARI": dateSadari,
      };
}

class DataSadariDetail {
  DataSadariDetail({
    required this.contentQuestion,
    required this.answer,
  });

  String contentQuestion;
  String answer;

  factory DataSadariDetail.fromJson(Map<String, dynamic> json) =>
      DataSadariDetail(
        contentQuestion: json["CONTENT_QUESTION"],
        answer: json["ANSWER"],
      );

  Map<String, dynamic> toJson() => {
        "CONTENT_QUESTION": contentQuestion,
        "ANSWER": answer,
      };
}
