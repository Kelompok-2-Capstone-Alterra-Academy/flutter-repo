class NewsModel {
  final String? title;
  final String? portal;
  final String? content;
  final String? img;
  final String? link;

  NewsModel({this.title, this.portal, this.content, this.img, this.link});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
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
