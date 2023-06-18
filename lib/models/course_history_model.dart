// To parse this JSON data, do
//
//     final courseHistoryModel = courseHistoryModelFromJson(jsonString);

import 'dart:convert';

class CourseHistoryModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? invoiceNumber;
  int? totalPayment;
  int? adminFees;
  String? status;
  int? studentId;
  Student? student;
  dynamic promoId;
  Promo? promo;
  String? token;
  List<TransactionDetail>? transactionDetails;

  CourseHistoryModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.invoiceNumber,
    this.totalPayment,
    this.adminFees,
    this.status,
    this.studentId,
    this.student,
    this.promoId,
    this.promo,
    this.token,
    this.transactionDetails,
  });

  factory CourseHistoryModel.fromRawJson(String str) =>
      CourseHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CourseHistoryModel.fromJson(Map<String, dynamic> json) =>
      CourseHistoryModel(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        invoiceNumber: json["invoice_number"],
        totalPayment: json["total_payment"],
        adminFees: json["admin_fees"],
        status: json["status"],
        studentId: json["student_id"],
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
        promoId: json["promo_id"],
        promo: json["promo"] == null ? null : Promo.fromJson(json["promo"]),
        token: json["token"],
        transactionDetails: json["transaction_details"] == null
            ? []
            : List<TransactionDetail>.from(json["transaction_details"]!
                .map((x) => TransactionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "invoice_number": invoiceNumber,
        "total_payment": totalPayment,
        "admin_fees": adminFees,
        "status": status,
        "student_id": studentId,
        "student": student?.toJson(),
        "promo_id": promoId,
        "promo": promo?.toJson(),
        "token": token,
        "transaction_details": transactionDetails == null
            ? []
            : List<dynamic>.from(transactionDetails!.map((x) => x.toJson())),
      };
}

class Promo {
  String? promoName;
  String? description;
  String? expiredDate;
  int? totalPromo;
  String? thumbnail;

  Promo({
    this.promoName,
    this.description,
    this.expiredDate,
    this.totalPromo,
    this.thumbnail,
  });

  factory Promo.fromRawJson(String str) => Promo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        promoName: json["promo_name"],
        description: json["description"],
        expiredDate: json["expired_date"],
        totalPromo: json["total_promo"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "promo_name": promoName,
        "description": description,
        "expired_date": expiredDate,
        "total_promo": totalPromo,
        "thumbnail": thumbnail,
      };
}

class Student {
  String? name;
  String? email;
  String? password;
  String? role;
  String? phoneNumber;
  String? status;
  String? schoolName;
  String? studentClass;
  String? gender;

  Student({
    this.name,
    this.email,
    this.password,
    this.role,
    this.phoneNumber,
    this.status,
    this.schoolName,
    this.studentClass,
    this.gender,
  });

  factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        schoolName: json["school_name"],
        studentClass: json["class"],
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
        "class": studentClass,
        "gender": gender,
      };
}

class TransactionDetail {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? price;
  int? transactionId;
  Transaction? transaction;
  String? courseId;
  Course? course;

  TransactionDetail({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.price,
    this.transactionId,
    this.transaction,
    this.courseId,
    this.course,
  });

  factory TransactionDetail.fromRawJson(String str) =>
      TransactionDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      TransactionDetail(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        price: json["price"],
        transactionId: json["transaction_id"],
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
        courseId: json["course_id"],
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "price": price,
        "transaction_id": transactionId,
        "transaction": transaction?.toJson(),
        "course_id": courseId,
        "course": course?.toJson(),
      };
}

class Course {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic categoryId;
  Category? category;
  int? classId;
  Class? courseClass;
  int? mentorId;
  Student? user;
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
  int? scores;

  Course({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.categoryId,
    this.category,
    this.classId,
    this.courseClass,
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
    this.scores,
  });

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        classId: json["class_id"],
        courseClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        mentorId: json["mentor_id"],
        user: json["user"] == null ? null : Student.fromJson(json["user"]),
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
        scores: json["scores"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "category_id": categoryId,
        "category": category?.toJson(),
        "class_id": classId,
        "class": courseClass?.toJson(),
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

class Transaction {
  String? invoiceNumber;
  int? totalPayment;
  int? adminFees;
  String? status;
  int? studentId;
  Student? student;
  dynamic promoId;
  Promo? promo;
  String? token;

  Transaction({
    this.invoiceNumber,
    this.totalPayment,
    this.adminFees,
    this.status,
    this.studentId,
    this.student,
    this.promoId,
    this.promo,
    this.token,
  });

  factory Transaction.fromRawJson(String str) =>
      Transaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        invoiceNumber: json["invoice_number"],
        totalPayment: json["total_payment"],
        adminFees: json["admin_fees"],
        status: json["status"],
        studentId: json["student_id"],
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
        promoId: json["promo_id"],
        promo: json["promo"] == null ? null : Promo.fromJson(json["promo"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "invoice_number": invoiceNumber,
        "total_payment": totalPayment,
        "admin_fees": adminFees,
        "status": status,
        "student_id": studentId,
        "student": student?.toJson(),
        "promo_id": promoId,
        "promo": promo?.toJson(),
        "token": token,
      };
}
