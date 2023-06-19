class ScheduleCourseModel {
  final String course;
  final String date;
  final String status;

  ScheduleCourseModel(
      {required this.course, required this.date, required this.status});

  factory ScheduleCourseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ScheduleCourseModel(
        course: json['course'], date: json['date'], status: json['status']);
  }

  Map<String, dynamic> toJson() => {
        'course': course,
        'date': date,
        'status': status,
      };
}
