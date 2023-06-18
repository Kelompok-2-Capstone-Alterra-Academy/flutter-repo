import 'dart:io';

import 'package:flutter/material.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class TaskViewModel with ChangeNotifier {
  dynamic response;

  final CourseAPI courseApi = CourseAPI();

  MyState myState = MyState.initial;

  Future<String> sendTask(
      {required token,
      required String moduleId,
      required File data,
      String? notes}) async {
    myState = MyState.loading;

    try {
      response = await courseApi.sendTask(
        token: token,
        moduleId: moduleId,
        data: data,
        notes: notes,
      );
      print(response);
      myState = MyState.success;
      return 'success';
    } catch (e) {
      myState = MyState.failed;
      return 'failed';
    }
  }
}
