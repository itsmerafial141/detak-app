import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.video,
    required this.duration,
  });

  String id;
  String title;
  String image;
  String content;
  String video;
  String duration;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        content: json["content"],
        video: json["video"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "content": content,
        "video": video,
        "duration": duration,
      };
}
