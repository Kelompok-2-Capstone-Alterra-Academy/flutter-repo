class Notif {
  final String title;
  final String course;
  final String description;
  final String date;
  final String time;

  Notif({
    required this.title,
    required this.course,
    required this.description,
    required this.date,
    required this.time,
  });

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
      title: json['title'],
      course: json['course'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'course': course,
      'description': description,
      'date': date,
      'time': time,
    };
  }
}
