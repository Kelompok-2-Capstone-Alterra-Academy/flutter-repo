class User {
  String name;
  String email;
  String password;
  String role;
  String phoneNumber;
  String status;
  String schoolName;
  String classes;
  String gender;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.role,
      required this.phoneNumber,
      required this.status,
      required this.schoolName,
      required this.classes,
      required this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        role: json['role'],
        phoneNumber: json['phone_number'],
        status: json['status'],
        schoolName: json['school_name'],
        classes: json['class'],
        gender: json['gender']);
  }

  Map<String, String> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'phone_number': phoneNumber,
      'status': status,
      'school_name': schoolName,
      'class': classes,
      'gender': gender,
    };
  }
}
