import 'package:flutter/material.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class TaskViewModel with ChangeNotifier {
  dynamic response;

  final CourseAPI courseApi = CourseAPI();

  MyState myState = MyState.initial;

  Future<String> sendTask() async {
    myState = MyState.loading;

    try {
      response = await courseApi.sendTask();
      myState = MyState.success;
      return 'success';
    } catch (e) {
      myState = MyState.failed;
      return 'failed';
    }
  }
}
