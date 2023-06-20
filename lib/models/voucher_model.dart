// class VoucherModel {
//   final int? id;
//   final String? title;
//   final String? expired;
//   final String? description;
//   final String? img;
//   final String? balance;
//   bool isClaim = false;

//   VoucherModel({
//     this.id,
//     this.title,
//     this.expired,
//     this.description,
//     this.img,
//     this.balance,
//   });
// }
// To parse this JSON data, do
//
//     final sellCourseModel = sellCourseModelFromJson(jsonString);

import 'dart:convert';

class VoucherModel {
  int? id;
  String? promoName;
  String? description;
  String? expiredDate;
  double? totalPromo;
  String? thumbnail;
  bool isClaim = false;
  bool promoUse = false;

  VoucherModel({
    this.id,
    this.promoName,
    this.description,
    this.expiredDate,
    this.totalPromo,
    this.thumbnail,
  });

  factory VoucherModel.fromRawJson(String str) =>
      VoucherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["ID"],
        promoName: json["promo_name"],
        description: json["description"],
        expiredDate: json["expired_date"],
        totalPromo: json["total_promo"]?.toDouble(),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "promo_name": promoName,
        "description": description,
        "expired_date": expiredDate,
        "total_promo": totalPromo,
        "thumbnail": thumbnail,
      };
}
