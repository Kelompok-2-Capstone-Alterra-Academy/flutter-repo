class PostFeedModel {
  final String? name;
  final String? time;
  final String? comment;
  final String? like;
  final String? reply;

  PostFeedModel({
    this.name,
    this.time,
    this.comment,
    this.like,
    this.reply,
  });
  factory PostFeedModel.fromJson(Map<String, dynamic> json) {
    return PostFeedModel(
        name: json['name'],
        time: json['time'],
        comment: json['comment'],
        like: json['like'],
        reply: json['reply']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'time': time,
        'comment': comment,
        'like': like,
        'reply': reply,
      };
}
