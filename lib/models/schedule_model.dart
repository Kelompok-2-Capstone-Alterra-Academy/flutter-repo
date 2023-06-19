class ScheduleCourseModel {
  final String course;
  final String date;
  final String status;
  final String url;

  ScheduleCourseModel(
      {required this.course,
      required this.date,
      required this.status,
      required this.url});

  factory ScheduleCourseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ScheduleCourseModel(
        course: json['course'],
        date: json['date'],
        status: json['status'],
        url: json['url']);
  }

  Map<String, dynamic> toJson() =>
      {'course': course, 'date': date, 'status': status, 'url': url};
}
