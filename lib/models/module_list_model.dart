class ModuleListModel {
  int? id;
  int? courseId;
  String? title;
  bool? video;
  bool? material;
  bool? assignment;
  bool? quiz;
  bool? finished;

  ModuleListModel({
    this.id,
    this.courseId,
    this.title,
    this.video,
    this.material,
    this.assignment,
    this.quiz,
    this.finished,
  });

  factory ModuleListModel.fromJson(Map<String, dynamic> json) {
    return ModuleListModel(
      id: json['id'],
      courseId: json['courseId'],
      title: json['title'],
      video: json['video'],
      material: json['material'],
      assignment: json['assignment'],
      quiz: json['quiz'],
      finished: json['finished'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'title': title,
      'video': video,
      'material': material,
      'assignment': assignment,
      'quiz': quiz,
      'finished': finished,
    };
  }
}
