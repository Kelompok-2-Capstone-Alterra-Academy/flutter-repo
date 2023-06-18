import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/module_details_model.dart';
import 'package:staredu/models/module_list_model.dart';
import 'package:staredu/models/service/module_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class ModuleListViewModel with ChangeNotifier {
  List<ModuleListModel> _moduleList = [];
  List<ModuleListModel> get moduleList => _moduleList;
  List<DetailVideoModel> _detailVideo = [];
  List<DetailVideoModel> get detailVideo => _detailVideo;
  List<DetailTaskModel> _detailTask = [];
  List<DetailTaskModel> get detailTask => _detailTask;
  List<QuizModel> _detailQuiz = [];
  List<QuizModel> get detailQuiz => _detailQuiz;
  List<NewCourseDetailModel> _courseModule = [];
  List<NewCourseDetailModel> get courseModule => _courseModule;

  final ModuleApi moduleApi = ModuleApi();

  MyState _myState = MyState.initial;
  MyState get myState => _myState;

  void setState(MyState myState) {
    _myState = myState;
    notifyListeners();
  }

  Future getCourseModule(String? token, int? courseId) async {
    setState(MyState.loading);

    try {
      _courseModule = await moduleApi.getAllModule(token, courseId);

      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response?.statusCode;
      }

      setState(MyState.failed);
      notifyListeners();
    }
  }

  Future getModuleList() async {
    setState(MyState.loading);

    try {
      _moduleList = await moduleApi.getModuleList();
      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      setState(MyState.failed);
    }
  }

  Future getSectionVideo() async {
    setState(MyState.loading);

    try {
      _detailVideo = await moduleApi.getSectionVideo();
      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      setState(MyState.failed);
    }
  }

  Future getSectionTask() async {
    setState(MyState.loading);

    try {
      _detailTask = await moduleApi.getSectionTask();
      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      setState(MyState.failed);
    }
  }

  Future getQuiz() async {
    setState(MyState.loading);

    try {
      _detailQuiz = await moduleApi.getSectionQuiz();
      setState(MyState.success);
      notifyListeners();
    } catch (e) {
      setState(MyState.failed);
    }
  }
}
