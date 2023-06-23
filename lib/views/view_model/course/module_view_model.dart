import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/module_details_model.dart';
import 'package:staredu/models/module_list_model.dart';
import 'package:staredu/models/new_module_list_model.dart';
import 'package:staredu/models/service/module_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class ModuleListViewModel with ChangeNotifier {
  List<ModuleListModel> _moduleList = [];
  List<ModuleListModel> get moduleList => _moduleList;

  List<NewModuleListModel> _courseModule = [];
  List<NewModuleListModel> get courseModule => _courseModule;
  List<NewModuleListModel> _courseQuiz = [];
  List<NewModuleListModel> get courseQuiz => _courseQuiz;

  final ModuleApi moduleApi = ModuleApi();

  MyState _myState = MyState.initial;
  MyState get myState => _myState;

  void setState(MyState myState) {
    _myState = myState;
    notifyListeners();
  }

  Future getCourseModule(String? token, int? courseId) async {
    setState(MyState.loading);

    final List<NewModuleListModel> tempCourseQuiz = [];

    try {
      final data = await moduleApi.getAllModule(token, courseId);
      for (var i in data) {
        for (var j in i.module!) {
          if (j.attachment!.type!.contains('quiz')) {
            tempCourseQuiz.add(i);
          }
          // else {
          //   tempCourseModule.add(i);
          // }
        }
      }

      _courseModule = data;
      _courseQuiz = tempCourseQuiz;

      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response?.statusCode;
      }
      setState(MyState.failed);
    }
  }
}
