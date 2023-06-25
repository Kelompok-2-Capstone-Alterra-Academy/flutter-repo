// class MentorModel {
//   final int? id;
//   final String? name;
//   final String? subject;
//   final String? phone;
//   final String? pic;

//   MentorModel({
//     this.id,
//     this.name,
//     this.subject,
//     this.phone,
//     this.pic,
//   });
// }

// To parse this JSON data, do
//
//     final mentorModel = mentorModelFromJson(jsonString);

import 'dart:convert';

class MentorModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? name;
  String? email;
  String? password;
  String? role;
  String? phoneNumber;
  String? status;
  String? schoolName;
  String? mentorModelClass;
  String? gender;
  String? profile;

  MentorModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.email,
    this.password,
    this.role,
    this.phoneNumber,
    this.status,
    this.schoolName,
    this.mentorModelClass,
    this.gender,
    this.profile,
  });

  factory MentorModel.fromRawJson(String str) =>
      MentorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        schoolName: json["school_name"],
        mentorModelClass: json["class"],
        gender: json["gender"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "phone_number": phoneNumber,
        "status": status,
        "school_name": schoolName,
        "class": mentorModelClass,
        "gender": gender,
        "profile": profile,
      };
}
