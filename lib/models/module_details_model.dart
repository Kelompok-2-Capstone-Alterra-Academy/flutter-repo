import 'dart:convert';

class DetailVideoModel {
  final String? link;
  final int? id;
  final int? sectionId;
  final int? courseId;

  DetailVideoModel({
    this.link,
    this.id,
    this.sectionId,
    this.courseId,
  });

  DetailVideoModel.fromJson(Map<String, dynamic> json, this.link, this.id,
      this.sectionId, this.courseId) {
    DetailVideoModel(
      link: json['link'],
      id: json['id'],
      sectionId: json['sectionId'],
      courseId: json['courseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'id': id,
      'sectionId': sectionId,
      'courseId': courseId,
    };
  }
}

class DetailTaskModel {
  final String? deskripsi;
  final int? id;
  final int? sectionId;
  final int? courseId;

  DetailTaskModel({
    this.deskripsi,
    this.id,
    this.sectionId,
    this.courseId,
  });

  DetailTaskModel.fromJson(Map<String, dynamic> json, this.deskripsi, this.id,
      this.sectionId, this.courseId) {
    DetailTaskModel(
      deskripsi: json['deskripsi'],
      id: json['id'],
      sectionId: json['sectionId'],
      courseId: json['courseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deskripsi': deskripsi,
      'id': id,
      'sectionId': sectionId,
      'courseId': courseId,
    };
  }
}

class QuizModel {
  final int? id;
  final int? sectionId;
  final int? courseId;

  QuizModel({
    this.id,
    this.sectionId,
    this.courseId,
  });

  QuizModel.fromJson(
      Map<String, dynamic> json, this.id, this.sectionId, this.courseId) {
    QuizModel(
      id: json['id'],
      sectionId: json['sectionId'],
      courseId: json['courseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sectionId': sectionId,
      'courseId': courseId,
    };
  }
}

// To parse this JSON data, do
//
//
//
//     final newCourseDetailModel = newCourseDetailModelFromJson(jsonString);

// class NewCourseDetailModel {
//   List<NewCourseDetailModel>? data;
//   int? statusCode;

//   NewCourseDetailModel({
//     this.data,
//     this.statusCode,
//   });

//   factory NewCourseDetailModel.fromRawJson(String str) =>
//       NewCourseDetailModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory NewCourseDetailModel.fromJson(Map<String, dynamic> json) =>
//       NewCourseDetailModel(
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//         statusCode: json["status code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "status code": statusCode,
//       };
// }

class NewCourseDetailModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? sectionName;
  String? courseId;
  Course? course;
  List<Module>? module;

  NewCourseDetailModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.sectionName,
    this.courseId,
    this.course,
    this.module,
  });

  factory NewCourseDetailModel.fromRawJson(String str) =>
      NewCourseDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewCourseDetailModel.fromJson(Map<String, dynamic> json) =>
      NewCourseDetailModel(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        sectionName: json["section_name"],
        courseId: json["course_id"],
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
        module: json["module"] == null
            ? []
            : List<Module>.from(json["module"]!.map((x) => Module.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "section_name": sectionName,
        "course_id": courseId,
        "course": course?.toJson(),
        "module": module == null
            ? []
            : List<dynamic>.from(module!.map((x) => x.toJson())),
      };
}

class Course {
  dynamic categoryId;
  Category? category;
  dynamic classId;
  Class? courseClass;
  int? mentorId;
  User? user;
  dynamic majorId;
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
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        classId: json["class_id"],
        courseClass:
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
        scores: json["scores"],
      );

  Map<String, dynamic> toJson() => {
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
  String? profile;

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
    this.profile,
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
        "class": userClass,
        "gender": gender,
        "profile": profile,
      };
}

class Module {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? moduleName;
  String? description;
  int? sectionId;
  Section? section;
  int? attachmentId;
  Attachment? attachment;
  List<Task>? tasks;
  dynamic submission;

  Module({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.moduleName,
    this.description,
    this.sectionId,
    this.section,
    this.attachmentId,
    this.attachment,
    this.tasks,
    this.submission,
  });

  factory Module.fromRawJson(String str) => Module.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        moduleName: json["module_name"],
        description: json["description"],
        sectionId: json["section_id"],
        section:
            json["section"] == null ? null : Section.fromJson(json["section"]),
        attachmentId: json["attachment_id"],
        attachment: json["attachment"] == null
            ? null
            : Attachment.fromJson(json["attachment"]),
        tasks: json["tasks"] == null
            ? []
            : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
        submission: json["submission"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "module_name": moduleName,
        "description": description,
        "section_id": sectionId,
        "section": section?.toJson(),
        "attachment_id": attachmentId,
        "attachment": attachment?.toJson(),
        "tasks": tasks == null
            ? []
            : List<dynamic>.from(tasks!.map((x) => x.toJson())),
        "submission": submission,
      };
}

class Attachment {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? attachmentName;
  String? description;
  String? type;
  String? attachmentSource;
  String? status;
  String? folderId;
  Folder? folder;

  Attachment({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.attachmentName,
    this.description,
    this.type,
    this.attachmentSource,
    this.status,
    this.folderId,
    this.folder,
  });

  factory Attachment.fromRawJson(String str) =>
      Attachment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        attachmentName: json["attachment_name"],
        description: json["description"],
        type: json["type"],
        attachmentSource: json["attachment_source"],
        status: json["status"],
        folderId: json["folder_id"],
        folder: json["folder"] == null ? null : Folder.fromJson(json["folder"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "attachment_name": attachmentName,
        "description": description,
        "type": type,
        "attachment_source": attachmentSource,
        "status": status,
        "folder_id": folderId,
        "folder": folder?.toJson(),
      };
}

class Folder {
  String? folderName;
  int? mentorId;
  User? mentor;

  Folder({
    this.folderName,
    this.mentorId,
    this.mentor,
  });

  factory Folder.fromRawJson(String str) => Folder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        folderName: json["folder_name"],
        mentorId: json["mentor_id"],
        mentor: json["mentor"] == null ? null : User.fromJson(json["mentor"]),
      );

  Map<String, dynamic> toJson() => {
        "folder_name": folderName,
        "mentor_id": mentorId,
        "mentor": mentor?.toJson(),
      };
}

class Section {
  String? sectionName;
  String? courseId;
  Course? course;

  Section({
    this.sectionName,
    this.courseId,
    this.course,
  });

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        sectionName: json["section_name"],
        courseId: json["course_id"],
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "section_name": sectionName,
        "course_id": courseId,
        "course": course?.toJson(),
      };
}

class Task {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  DateTime? dueDate;
  String? moduleId;

  Task({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.dueDate,
    this.moduleId,
  });

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        moduleId: json["module_id"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "due_date": dueDate?.toIso8601String(),
        "module_id": moduleId,
      };
}
