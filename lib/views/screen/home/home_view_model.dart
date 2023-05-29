import 'package:flutter/material.dart';
import 'package:staredu/models/mentor.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/models/service/mentor_api.dart';
import 'package:staredu/models/type_course.dart';

class HomeViewModel extends ChangeNotifier {
  List<TypeCourse> _typeCourse = [];
  List<Mentor> _mentor = [];

  List<TypeCourse> get typeCourse => _typeCourse;
  List<Mentor> get mentor => _mentor;

  void getAllTypeCourse() async {
    _typeCourse = await CourseAPI.getTypeCourse();
    notifyListeners();
  }

  void getAllMentor() async {
    _mentor = await MentorAPI.getAllMentor();
    notifyListeners();
  }
}
