class Mentor {
  int id;
  String name;
  String profile;

  Mentor({required this.id, required this.name, required this.profile});

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(id: json['ID'], name: json['name'], profile: json['profile']);
  }

  Map<String, dynamic> toJson() => {
        'ID': id,
        'name': name,
        'image': profile,
      };
}
