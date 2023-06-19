import 'package:flutter/material.dart';
import 'package:staredu/models/service/course_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class TaskViewModel with ChangeNotifier {
  dynamic response;

  String _fileName = "nama_file.pdf/jpg";
  String get fileName => _fileName;
  String _filePath = "";
  String get filePath => _filePath;
  MyState _state = MyState.initial;
  MyState get state => _state;

  final CourseAPI courseApi = CourseAPI();

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }

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
    setState(MyState.loading);

    try {
      response = await courseApi.sendTask(
        token: token,
        moduleId: moduleId,
        filePath: filePath,
        notes: notes,
      );
      setState(MyState.success);
      return 'success';
    } catch (e) {
      setState(MyState.failed);
      return e.toString();
    }
  }
}
