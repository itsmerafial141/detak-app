import 'dart:convert';

BeritaModel beritaModelFromJson(String str) =>
    BeritaModel.fromJson(json.decode(str));

String beritaModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
  BeritaModel({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.penulis,
    required this.kategori,
    required this.tanggal,
    required this.waktu,
  });

  String id;
  String title;
  String image;
  String content;
  String penulis;
  String kategori;
  String tanggal;
  String waktu;

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        content: json["content"],
        penulis: json["penulis"],
        kategori: json["kategori"],
        tanggal: json["tanggal"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "content": content,
        "penulis": penulis,
        "kategori": kategori,
        "tanggal": tanggal,
        "waktu": waktu,
      };
}
