import 'dart:convert';

List<ModelClass> ModelClassFromJson(String str) => List<ModelClass>.from(json.decode(str).map((x) => ModelClass.fromJson(x)));

String ModelClassToJson(List<ModelClass> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelClass {
  ModelClass({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}