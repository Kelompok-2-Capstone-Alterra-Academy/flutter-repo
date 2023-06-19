import 'dart:io';

import 'package:flutter/material.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class TaskViewModel with ChangeNotifier {
  dynamic response;

  String _fileName = "";
  String get fileName => _fileName;
  String _filePath = "";
  String get filePath => _filePath;

  final CourseAPI courseApi = CourseAPI();

  MyState myState = MyState.initial;

  void setAssignmentFile({required String name, required String path}) {
    _fileName = name;
    _filePath = path;
    notifyListeners();
  }

  Future<String> sendTask(
      {required token,
      required String moduleId,
      required String filePath,
      String? notes}) async {
    myState = MyState.loading;

    try {
      response = await courseApi.sendTask(
        token: token,
        moduleId: moduleId,
        filePath: filePath,
        notes: notes,
      );
      print(response);
      myState = MyState.success;
      return 'success';
    } catch (e) {
      myState = MyState.failed;
      return e.toString();
    }
  }
}
