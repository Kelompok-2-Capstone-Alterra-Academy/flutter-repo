class User {
  int? id;
  String? name;
  String? email;
  String? date_of_birth;
  String? hometown;
  String? phoneNumber;
  String? major;
  String? schoolName;
  String? classes;
  String? gender;
  String? profile;

  User(
      {this.id,
      this.name,
      this.email,
      this.date_of_birth,
      this.hometown,
      this.phoneNumber,
      this.major,
      this.schoolName,
      this.classes,
      this.gender,
      this.profile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['ID'],
        name: json['name'],
        email: json['email'],
        date_of_birth: json['date_of_birth'],
        hometown: json['hometown'],
        phoneNumber: json['phone_number'],
        major: json['major'],
        schoolName: json['school_name'],
        classes: json['class'],
        gender: json['gender'],
        profile: json['profile']);
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'name': name,
      'email': email,
      'date_of_birth': date_of_birth,
      'hometown': hometown,
      'phone_number': phoneNumber,
      'major': major,
      'school_name': schoolName,
      'class': classes,
      'gender': gender,
      'profile': profile
    };
  }
}
