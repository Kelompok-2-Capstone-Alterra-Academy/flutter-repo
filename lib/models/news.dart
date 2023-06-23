class News {
  String title;
  String portal;
  String content;
  String img;
  String link;

  News(
      {required this.title,
      required this.portal,
      required this.content,
      required this.img,
      required this.link});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        portal: json['portal'],
        content: json['content'],
        img: json['img'],
        link: json['link']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'portal': portal,
        'content': content,
        'img': img,
        'link': link,
      };
}
