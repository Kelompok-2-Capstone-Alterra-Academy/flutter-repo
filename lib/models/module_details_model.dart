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
