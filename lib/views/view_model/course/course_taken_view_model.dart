import 'package:flutter/material.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class CourseTakenViewModel with ChangeNotifier {
  List<CourseTakenModel> _courseTaken = [];
  List<CourseTakenModel> get courseTaken => _courseTaken;

  double _rating = 0;
  double get rating => _rating;
  bool _isRatingInputted = false;
  bool get isRatingInputted => _isRatingInputted;

  dynamic response;

  final CourseAPI courseApi = CourseAPI();

  MyState myState = MyState.initial;

  void setRating(double value) {
    _rating = value;
    _isRatingInputted = true;
    notifyListeners();
  }

  void clearRating() {
    _rating = 0;
    _isRatingInputted = false;
    notifyListeners();
  }

  Future getCourseTaken() async {
    myState = MyState.loading;

    try {
      _courseTaken = await courseApi.getCourseTaken();
      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }

  Future<String> sendReview() async {
    myState = MyState.loading;

    try {
      response = await courseApi.sendReview();
      myState = MyState.success;
      return response;
    } catch (e) {
      myState = MyState.failed;
      return 'failed';
    }
  }
}
