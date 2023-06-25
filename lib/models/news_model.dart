// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? userId;
  String? tittle;
  String? shortDescription;
  String? thumbnail;
  String? link;

  NewsModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.tittle,
    this.shortDescription,
    this.thumbnail,
    this.link,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        userId: json["user_id"],
        tittle: json["tittle"],
        shortDescription: json["short_description"],
        thumbnail: json["thumbnail"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "user_id": userId,
        "tittle": tittle,
        "short_description": shortDescription,
        "thumbnail": thumbnail,
        "link": link,
      };
}
