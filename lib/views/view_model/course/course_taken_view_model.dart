import 'package:flutter/material.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class CourseTakenViewModel with ChangeNotifier {
  List<InProgress> _inProgressCourseTaken = [];
  List<InProgress> get inProgressCourseTaken => _inProgressCourseTaken;
  List<InProgress> _completedCourseTaken = [];
  List<InProgress> get completedCourseTaken => _completedCourseTaken;
  List<InProgress> _tempInProgressCourseTaken = [];
  List<InProgress> get tempInProgressCourseTaken => _tempInProgressCourseTaken;
  List<InProgress> _tempCompletedCourseTaken = [];
  List<InProgress> get tempCompletedCourseTaken => _tempCompletedCourseTaken;

  double _rating = 0;
  double get rating => _rating;
  bool _isRatingInputted = false;
  bool get isRatingInputted => _isRatingInputted;

  MyState _state = MyState.initial;
  MyState get state => _state;

  dynamic response;
  final CourseAPI courseApi = CourseAPI();

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }

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

  void filterCourse(
      {String? filterBy, String? majorFilter, String? classFilter}) {
    //save current list to temporary so dont need to re-request to api
    _tempInProgressCourseTaken = List.from(_inProgressCourseTaken);
    _tempCompletedCourseTaken = List.from(_completedCourseTaken);

    //clear current list
    _inProgressCourseTaken.clear();
    _completedCourseTaken.clear();

    //filter by checking the conditions
    for (var i in _tempInProgressCourseTaken) {
      if (filterBy == "class") {
        // print('by class');
        if (i.inProgressClass!.className == classFilter) {
          _inProgressCourseTaken.add(i);
        }
      }
      if (filterBy == "major") {
        // print('by major');
        if (i.major!.majorName == majorFilter) {
          _inProgressCourseTaken.add(i);
        }
      }
      if (filterBy == "both") {
        // print('by both');
        if (i.major!.majorName == majorFilter &&
            i.inProgressClass!.className == classFilter) {
          _inProgressCourseTaken.add(i);
        }
      }
    }
    for (var i in _tempCompletedCourseTaken) {
      if (filterBy == "class") {
        if (i.inProgressClass!.className == classFilter) {
          _completedCourseTaken.add(i);
        }
      }
      if (filterBy == "major") {
        if (i.major!.majorName == majorFilter) {
          _completedCourseTaken.add(i);
        }
      }
      if (filterBy == "both") {
        if (i.major!.majorName == majorFilter &&
            i.inProgressClass!.className == classFilter) {
          _completedCourseTaken.add(i);
        }
      }
    }
    notifyListeners();
  }

  void resetFilterCourse() {
    //clear current list
    _inProgressCourseTaken.clear();
    _completedCourseTaken.clear();

    //set the data from saved data before
    _inProgressCourseTaken = _tempInProgressCourseTaken;
    _completedCourseTaken = _tempCompletedCourseTaken;
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
