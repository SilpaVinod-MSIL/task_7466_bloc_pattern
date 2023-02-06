import 'dart:convert';

List<FetchUIData> FetchUIDataFromJson(String str) => List<FetchUIData>.from(json.decode(str).map((x) => FetchUIData.fromJson(x)));

String FetchUIDataToJson(List<FetchUIData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchUIData {
  FetchUIData({
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

  factory FetchUIData.fromJson(Map<String, dynamic> json) => FetchUIData(
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