import 'dart:convert';

class CourseTakenModel {
  Data? data;
  int? statusCode;

  CourseTakenModel({
    this.data,
    this.statusCode,
  });

  factory CourseTakenModel.fromRawJson(String str) =>
      CourseTakenModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CourseTakenModel.fromJson(Map<String, dynamic> json) =>
      CourseTakenModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        statusCode: json["status code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status code": statusCode,
      };
}

class Data {
  List<InProgress>? inProgress;
  List<InProgress>? selesai;

  Data({
    this.inProgress,
    this.selesai,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        inProgress: json["in_progress"] == null
            ? []
            : List<InProgress>.from(
                json["in_progress"]!.map((x) => InProgress.fromJson(x))),
        selesai: json["selesai"] == null
            ? []
            : List<InProgress>.from(
                json["selesai"]!.map((x) => InProgress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "in_progress": inProgress == null
            ? []
            : List<dynamic>.from(inProgress!.map((x) => x.toJson())),
        "selesai": selesai == null
            ? []
            : List<dynamic>.from(selesai!.map((x) => x.toJson())),
      };
}

class InProgress {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? categoryId;
  Category? category;
  int? classId;
  Class? inProgressClass;
  int? mentorId;
  User? user;
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

  InProgress({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.categoryId,
    this.category,
    this.classId,
    this.inProgressClass,
    this.mentorId,
    this.user,
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
  });

  factory InProgress.fromRawJson(String str) =>
      InProgress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InProgress.fromJson(Map<String, dynamic> json) => InProgress(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"] == null
            ? null
            : DateTime.parse(json["DeletedAt"]),
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        classId: json["class_id"],
        inProgressClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        mentorId: json["mentor_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt?.toIso8601String(),
        "category_id": categoryId,
        "category": category?.toJson(),
        "class_id": classId,
        "class": inProgressClass?.toJson(),
        "mentor_id": mentorId,
        "user": user?.toJson(),
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

class Class {
  String? className;

  Class({
    this.className,
  });

  factory Class.fromRawJson(String str) => Class.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        className: json["class_name"],
      );

  Map<String, dynamic> toJson() => {
        "class_name": className,
      };
}

class Major {
  String? majorName;

  Major({
    this.majorName,
  });

  factory Major.fromRawJson(String str) => Major.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        majorName: json["major_name"],
      );

  Map<String, dynamic> toJson() => {
        "major_name": majorName,
      };
}

class User {
  String? name;
  String? email;
  String? password;
  String? role;
  String? phoneNumber;
  String? status;
  String? schoolName;
  String? userClass;
  String? gender;

  User({
    this.name,
    this.email,
    this.password,
    this.role,
    this.phoneNumber,
    this.status,
    this.schoolName,
    this.userClass,
    this.gender,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        schoolName: json["school_name"],
        userClass: json["class"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "phone_number": phoneNumber,
        "status": status,
        "school_name": schoolName,
        "class": userClass,
        "gender": gender,
      };
}
