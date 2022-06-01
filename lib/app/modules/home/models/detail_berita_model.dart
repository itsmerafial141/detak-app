import 'dart:convert';

DetailBeritaModel detailBeritaModelFromJson(String str) =>
    DetailBeritaModel.fromJson(json.decode(str));

String detailBeritaModelToJson(DetailBeritaModel data) =>
    json.encode(data.toJson());

class DetailBeritaModel {
  DetailBeritaModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory DetailBeritaModel.fromJson(Map<String, dynamic> json) =>
      DetailBeritaModel(
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
    required this.idNews,
    required this.nameCategory,
    required this.titleNews,
    required this.contentNews,
    required this.viewsCount,
    required this.sharesCount,
    required this.dateNews,
    required this.newsImage,
    required this.editor,
    required this.verificator,
  });

  String idNews;
  String nameCategory;
  String titleNews;
  String contentNews;
  String viewsCount;
  String sharesCount;
  String dateNews;
  String newsImage;
  String editor;
  String verificator;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idNews: json["ID_NEWS"],
        nameCategory: json["NAME_CATEGORY"],
        titleNews: json["TITLE_NEWS"],
        contentNews: json["CONTENT_NEWS"],
        viewsCount: json["VIEWS_COUNT"],
        sharesCount: json["SHARES_COUNT"],
        dateNews: json["DATE_NEWS"],
        newsImage: json["NEWS_IMAGE"],
        editor: json["EDITOR"],
        verificator: json["VERIFICATOR"],
      );

  Map<String, dynamic> toJson() => {
        "ID_NEWS": idNews,
        "NAME_CATEGORY": nameCategory,
        "TITLE_NEWS": titleNews,
        "CONTENT_NEWS": contentNews,
        "VIEWS_COUNT": viewsCount,
        "SHARES_COUNT": sharesCount,
        "DATE_NEWS": dateNews,
        "NEWS_IMAGE": newsImage,
        "EDITOR": editor,
        "VERIFICATOR": verificator,
      };
}
