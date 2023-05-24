class Mentor {
  int id;
  String name;
  String image;

  Mentor({required this.id, required this.name, required this.image});

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(id: json['id'], name: json['name'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
