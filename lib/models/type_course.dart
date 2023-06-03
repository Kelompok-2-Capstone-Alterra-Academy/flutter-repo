class TypeCourse {
  int id;
  String name;

  TypeCourse({required this.id, required this.name});

  factory TypeCourse.fromJson(Map<String, dynamic> json) {
    return TypeCourse(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
