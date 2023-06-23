import 'package:flutter/material.dart';
import 'package:staredu/models/mentor.dart';
import 'package:staredu/models/post_feed_model.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/models/service/mentor_api.dart';
import 'package:staredu/models/service/post_feed_api.dart';
import 'package:staredu/models/type_course.dart';
import 'package:staredu/utils/state/my_state.dart';

class HomeViewModel extends ChangeNotifier {
  Mentor? response;
  MyState _stateMentor = MyState.initial;
  MyState _stateCourse = MyState.initial;

  List<TypeCourse> _typeCourse = [];
  List<Mentor> _mentor = [];
  List<PostFeedModel> _postFeeds = [];

  List<TypeCourse> get typeCourse => _typeCourse;
  List<Mentor> get mentor => _mentor;
  List<PostFeedModel> get postFeeds => _postFeeds;

  void getAllTypeCourse(String? token) async {
    // try {
    //   dynamic res = await CourseAPI.getTypeCourse(token);
    //   if (res == null) {
    //     setStateMentor(MyState.failed);
    //     return null;
    //   }
    //   List<dynamic> data = res['data'];
    //   _typeCourse = data.map((e) => TypeCourse.fromJson(e)).toList();
    //   setStateMentor(MyState.success);
    // } catch (e) {
    //   setStateMentor(MyState.failed);
    // }

    _typeCourse = await CourseAPI.getTypeCourse(token);
    notifyListeners();
  }

  void getAllMentor(String? token) async {
    try {
      dynamic res = await MentorAPI.getAllMentor(token);
      if (res == null) {
        setStateMentor(MyState.failed);
        return null;
      }
      List<dynamic> data = res['data'];
      List<Mentor> temp = data.map((e) => Mentor.fromJson(e)).toList();
      _mentor = temp.take(5).toList();
      setStateMentor(MyState.success);
    } catch (e) {
      setStateMentor(MyState.failed);
    }
  }

  void getAllCourses(String? token) async {
    try {
      CourseAPI courseAPI = CourseAPI();
      dynamic res = await courseAPI.getCourseForSale(token);
      if (res == null) {
        setStateCourse(MyState.failed);
        return null;
      }
      setStateCourse(MyState.success);
    } catch (e) {
      setStateCourse(MyState.failed);
    }
  }

  void setStateMentor(MyState state) {
    _stateMentor = state;
    notifyListeners();
  }

  void setStateCourse(MyState state) {
    _stateCourse = state;
    notifyListeners();
  }

  void getPostFeed() async {
    _postFeeds = await PostFeedAPI.getPostFeed();
    notifyListeners();
  }
}
