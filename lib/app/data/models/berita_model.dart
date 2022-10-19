import 'dart:convert';

BeritaModel beritaModelFromJson(String str) =>
    BeritaModel.fromJson(json.decode(str));

String beritaModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
  BeritaModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
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
    required this.idNews,
    required this.nameCategory,
    required this.titleNews,
    required this.newsImage,
    required this.dateNews,
    required this.editor,
    required this.verificator,
  });

  String idNews;
  String nameCategory;
  String titleNews;
  String newsImage;
  String dateNews;
  String editor;
  String verificator;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idNews: json["ID_NEWS"],
        nameCategory: json["NAME_CATEGORY"],
        titleNews: json["TITLE_NEWS"],
        newsImage: json["NEWS_IMAGE"],
        dateNews: json["DATE_NEWS"],
        editor: json["EDITOR"],
        verificator: json["VERIFICATOR"],
      );

  Map<String, dynamic> toJson() => {
        "ID_NEWS": idNews,
        "NAME_CATEGORY": nameCategory,
        "TITLE_NEWS": titleNews,
        "NEWS_IMAGE": newsImage,
        "DATE_NEWS": dateNews,
        "EDITOR": editor,
        "VERIFICATOR": verificator,
      };
}
