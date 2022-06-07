// To parse this JSON data, do
//
//     final beritaSliderModel = beritaSliderModelFromJson(jsonString);

import 'dart:convert';

BeritaSliderModel beritaSliderModelFromJson(String str) =>
    BeritaSliderModel.fromJson(json.decode(str));

String beritaSliderModelToJson(BeritaSliderModel data) =>
    json.encode(data.toJson());

class BeritaSliderModel {
  BeritaSliderModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory BeritaSliderModel.fromJson(Map<String, dynamic> json) =>
      BeritaSliderModel(
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
    required this.contentNews,
    required this.viewsCount,
    required this.sharesCount,
    required this.dateNews,
    required this.newsImage,
    this.likes,
    required this.editor,
    required this.verificator,
    required this.status,
  });

  String idNews;
  String nameCategory;
  String titleNews;
  String contentNews;
  String viewsCount;
  String sharesCount;
  String dateNews;
  List<String> newsImage;
  dynamic likes;
  String editor;
  String verificator;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idNews: json["ID_NEWS"],
        nameCategory: json["NAME_CATEGORY"],
        titleNews: json["TITLE_NEWS"],
        contentNews: json["CONTENT_NEWS"],
        viewsCount: json["VIEWS_COUNT"],
        sharesCount: json["SHARES_COUNT"],
        dateNews: json["DATE_NEWS"],
        newsImage: List<String>.from(json["NEWS_IMAGE"].map((x) => x)),
        likes: json["LIKES"],
        editor: json["EDITOR"],
        verificator: json["VERIFICATOR"],
        status: json["STATUS"],
      );

  Map<String, dynamic> toJson() => {
        "ID_NEWS": idNews,
        "NAME_CATEGORY": nameCategory,
        "TITLE_NEWS": titleNews,
        "CONTENT_NEWS": contentNews,
        "VIEWS_COUNT": viewsCount,
        "SHARES_COUNT": sharesCount,
        "DATE_NEWS": dateNews,
        "NEWS_IMAGE": List<dynamic>.from(newsImage.map((x) => x)),
        "LIKES": likes,
        "EDITOR": editor,
        "VERIFICATOR": verificator,
        "STATUS": status,
      };
}
