// class SellCourseModel {
//   final int? id;
//   final String? title;
//   final String? price;
//   final String? rating;
//   final String? student;
//   final String? img;
//   final String? grade;

//   SellCourseModel({
//     this.id,
//     this.title,
//     this.price,
//     this.rating,
//     this.student,
//     this.img,
//     this.grade,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'price': price,
//       'rating': rating,
//       'student': student,
//       'img': img,
//       'grade': grade,
//     };
//   }

//   factory SellCourseModel.fromJson(Map<String, dynamic> json) {
//     return SellCourseModel(
//       id: json['id'],
//       title: json['title'],
//       price: json['price'],
//       rating: json['rating'],
//       student: json['student'],
//       img: json['img'],
//       grade: json['grade'],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final sellCourseModel = sellCourseModelFromJson(jsonString);

import 'dart:convert';

class SellCourseModel {
  int? id;
  dynamic categoryId;
  Category? category;
  String? courseName;
  String? price;
  String? duration;
  String? status;
  String? description;
  String? thumbnail;
  String? liveSessionWeek;

  SellCourseModel({
    this.id,
    this.categoryId,
    this.category,
    this.courseName,
    this.price,
    this.duration,
    this.status,
    this.description,
    this.thumbnail,
    this.liveSessionWeek,
  });

  factory SellCourseModel.fromRawJson(String str) =>
      SellCourseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellCourseModel.fromJson(Map<String, dynamic> json) =>
      SellCourseModel(
        id: json["ID"],
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        courseName: json["course_name"],
        price: json["price"],
        duration: json["duration"],
        status: json["status"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        liveSessionWeek: json["live_session_week"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "category_id": categoryId,
        "category": category?.toJson(),
        "course_name": courseName,
        "price": price,
        "duration": duration,
        "status": status,
        "description": description,
        "thumbnail": thumbnail,
        "live_session_week": liveSessionWeek,
      };
}

class Category {
  String? categoryName;

  Category({
    this.categoryName,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
      };
}
