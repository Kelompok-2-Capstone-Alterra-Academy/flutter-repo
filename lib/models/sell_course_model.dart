// To parse this JSON data, do
//     final sellCourseModel = sellCourseModelFromJson(jsonString);
import 'dart:convert';

class SellCourseModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic categoryId;
  Category? category;
  int? classId;
  Class? sellCourseModelClass;
  int? majorId;
  Major? major;
  String? courseName;
  String? price;
  String? duration;
  String? status;
  String? description;
  String? thumbnail;
  String? liveSessionWeek;
  int? numStudents;
  double? scores;

  SellCourseModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.categoryId,
    this.category,
    this.classId,
    this.sellCourseModelClass,
    this.majorId,
    this.major,
    this.courseName,
    this.price,
    this.duration,
    this.status,
    this.description,
    this.thumbnail,
    this.liveSessionWeek,
    this.numStudents,
    this.scores,
  });

  factory SellCourseModel.fromRawJson(String str) =>
      SellCourseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellCourseModel.fromJson(Map<String, dynamic> json) =>
      SellCourseModel(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        classId: json["class_id"],
        sellCourseModelClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        majorId: json["major_id"],
        major: json["major"] == null ? null : Major.fromJson(json["major"]),
        courseName: json["course_name"],
        price: json["price"],
        duration: json["duration"],
        status: json["status"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        liveSessionWeek: json["live_session_week"],
        numStudents: json["num_students"],
        scores: json["scores"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "category_id": categoryId,
        "category": category?.toJson(),
        "class_id": classId,
        "class": sellCourseModelClass?.toJson(),
        "major_id": majorId,
        "major": major?.toJson(),
        "course_name": courseName,
        "price": price,
        "duration": duration,
        "status": status,
        "description": description,
        "thumbnail": thumbnail,
        "live_session_week": liveSessionWeek,
        "num_students": numStudents,
        "scores": scores,
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

class Major {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? majorName;

  Major({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.majorName,
  });

  factory Major.fromRawJson(String str) => Major.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        majorName: json["major_name"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "major_name": majorName,
      };
}

class Class {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? className;

  Class({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.className,
  });

  factory Class.fromRawJson(String str) => Class.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        className: json["class_name"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "class_name": className,
      };
}
