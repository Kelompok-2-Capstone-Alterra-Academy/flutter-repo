import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../models/sell_course_model.dart';
import '../../../models/service/course_api.dart';
import '../../../utils/state/my_state.dart';

class SellCourseViewModel extends ChangeNotifier {
  List<SellCourseModel> _courseForSale = [];
  List<SellCourseModel> get courseForSale => _courseForSale;

  List<SellCourseModel> _findCourse = [];
  List<SellCourseModel> get findCourse => _findCourse;

  final CourseAPI courseAPI = CourseAPI();

  MyState myState = MyState.initial;

  Future getAllCourseForSale() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _courseForSale = await courseAPI.getCourseForSale();
      _findCourse = _courseForSale;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response?.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }

  void searching(String enterKey) {
    List<SellCourseModel> results = [];
    if (enterKey.isEmpty) {
      results = _courseForSale;
    } else {
      results = _courseForSale
          .where((user) =>
              user.title!.toLowerCase().contains(enterKey.toLowerCase()))
          .toList();
    }
    _findCourse = results;
    notifyListeners();
  }
}