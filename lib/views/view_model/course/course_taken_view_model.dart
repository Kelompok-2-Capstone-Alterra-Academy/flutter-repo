import 'package:flutter/material.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class CourseTakenViewModel with ChangeNotifier {
  List<InProgress> _inProgressCourseTaken = [];
  List<InProgress> get inProgressCourseTaken => _inProgressCourseTaken;
  List<InProgress> _completedCourseTaken = [];
  List<InProgress> get completedCourseTaken => _completedCourseTaken;

  double _rating = 0;
  double get rating => _rating;
  bool _isRatingInputted = false;
  bool get isRatingInputted => _isRatingInputted;

  dynamic response;

  final CourseAPI courseApi = CourseAPI();

  MyState _state = MyState.initial;
  MyState get state => _state;

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

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }

  Future getCourseTaken(String token) async {
    setState(MyState.loading);

    try {
      final data = await courseApi.getCourseTaken(token);

      _inProgressCourseTaken =
          CourseTakenModel.fromJson(data).data!.inProgress ?? [];
      // print("inprogress : $_inProgressCourseTaken");
      _completedCourseTaken =
          CourseTakenModel.fromJson(data).data!.selesai ?? [];
      // print("finished : $_completedCourseTaken");
      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      setState(MyState.failed);
    }
  }

  Future<String> sendReview() async {
    setState(MyState.loading);

    try {
      response = await courseApi.sendReview();
      setState(MyState.success);
      return response;
    } catch (e) {
      setState(MyState.failed);
      return 'failed';
    }
  }
}
