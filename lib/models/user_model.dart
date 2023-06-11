class User {
  String name;
  String email;
  String dob;
  String city;
  String phoneNumber;
  String major;
  String schoolName;
  String classes;
  String gender;

  User(
      {required this.name,
      required this.email,
      required this.dob,
      required this.city,
      required this.phoneNumber,
      required this.major,
      required this.schoolName,
      required this.classes,
      required this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        dob: json['dob'],
        city: json['city'],
        phoneNumber: json['phone_number'],
        major: json['major'],
        schoolName: json['school_name'],
        classes: json['class'],
        gender: json['gender']);
  }

  Map<String, String> toJson() {
    return {
      'name': name,
      'email': email,
      'dob': dob,
      'city': city,
      'phone_number': phoneNumber,
      'major': major,
      'school_name': schoolName,
      'class': classes,
      'gender': gender,
    };
  }
}
