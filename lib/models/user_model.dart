class User {
  int? id;
  String? name;
  String? email;
  String? dob;
  String? city;
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
      this.dob,
      this.city,
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
        dob: json['dob'],
        city: json['city'],
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
      'dob': dob,
      'city': city,
      'phone_number': phoneNumber,
      'major': major,
      'school_name': schoolName,
      'class': classes,
      'gender': gender,
      'profile': profile
    };
  }
}
