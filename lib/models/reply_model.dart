class ReplyModel {
  final String name;
  final String time;
  final String comment;

  ReplyModel({
    required this.name,
    required this.time,
    required this.comment,
  });
  factory ReplyModel.fromJson(Map<String, dynamic> json) {
    return ReplyModel(
      name: json['name'],
      time: json['time'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'time': time,
        'comment': comment,
      };
}
