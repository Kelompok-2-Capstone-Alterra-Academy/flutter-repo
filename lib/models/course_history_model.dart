// To parse this JSON data, do
//
//     final courseHistoryModel = courseHistoryModelFromJson(jsonString);

import 'dart:convert';

class CourseHistoryModel {
  Data? data;
  String? message;
  int? statusCode;

  CourseHistoryModel({
    this.data,
    this.message,
    this.statusCode,
  });

  factory CourseHistoryModel.fromRawJson(String str) =>
      CourseHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CourseHistoryModel.fromJson(Map<String, dynamic> json) =>
      CourseHistoryModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status code": statusCode,
      };
}

class Data {
  List<TransactionElement>? transaction;

  Data({
    this.transaction,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transaction: json["transaction"] == null
            ? []
            : List<TransactionElement>.from(json["transaction"]!
                .map((x) => TransactionElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transaction": transaction == null
            ? []
            : List<dynamic>.from(transaction!.map((x) => x.toJson())),
      };
}

class TransactionElement {
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

  TransactionElement({
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

  factory TransactionElement.fromRawJson(String str) =>
      TransactionElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionElement.fromJson(Map<String, dynamic> json) =>
      TransactionElement(
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
  String? hometown;
  String? major;

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
    this.hometown,
    this.major,
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
        hometown: json["hometown"],
        major: json["major"],
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
        "hometown": hometown,
        "major": major,
      };
}

class TransactionDetail {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? price;
  int? transactionId;
  TransactionDetailTransaction? transaction;
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
            : TransactionDetailTransaction.fromJson(json["transaction"]),
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

class TransactionDetailTransaction {
  String? invoiceNumber;
  int? totalPayment;
  int? adminFees;
  String? status;
  int? studentId;
  Student? student;
  dynamic promoId;
  Promo? promo;
  String? token;

  TransactionDetailTransaction({
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

  factory TransactionDetailTransaction.fromRawJson(String str) =>
      TransactionDetailTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionDetailTransaction.fromJson(Map<String, dynamic> json) =>
      TransactionDetailTransaction(
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
