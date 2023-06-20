class CourseCertificateModel {
  final String? link;
  final int? id;

  final int? courseId;

  CourseCertificateModel({
    this.link,
    this.id,
    this.courseId,
  });

  CourseCertificateModel.fromJson(
      Map<String, dynamic> json, this.link, this.id, this.courseId) {
    CourseCertificateModel(
      link: json['link'],
      id: json['id'],
      courseId: json['courseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'id': id,
      'courseId': courseId,
    };
  }
}
