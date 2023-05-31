class SellCourseModel {
  final int? id;
  final String? title;
  final String? price;
  final String? rating;
  final String? student;
  final String? img;
  final String? grade;

  SellCourseModel({
    this.id,
    this.title,
    this.price,
    this.rating,
    this.student,
    this.img,
    this.grade,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'rating': rating,
      'student': student,
      'img': img,
      'grade': grade,
    };
  }

  factory SellCourseModel.fromJson(Map<String, dynamic> json) {
    return SellCourseModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      student: json['student'],
      img: json['img'],
      grade: json['grade'],
    );
  }
}
