import 'package:flutter/material.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/service/course_taken_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class CourseTakenViewModel with ChangeNotifier {
  List<CourseTakenModel> _courseTaken = [];
  List<CourseTakenModel> get courseTaken => _courseTaken;

  final CourseTakenApi courseTakenApi = CourseTakenApi();

  MyState myState = MyState.initial;

  Future getCourseTaken() async {
    myState = MyState.loading;

    try {
      _courseTaken = await courseTakenApi.getCourseTaken();
      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }
}
