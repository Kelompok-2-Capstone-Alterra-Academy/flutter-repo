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
  String? profile;

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
    this.profile,
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
        profile: json["profile"],
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
        "profile": profile,
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

  TransactionDetail({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.price,
    this.transactionId,
    this.transaction,
    this.courseId,
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
