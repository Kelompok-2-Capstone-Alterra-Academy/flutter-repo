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

  final ModuleApi moduleApi = ModuleApi();

  MyState myState = MyState.initial;

  ModuleApi api = ModuleApi();

  Future getModuleList() async {
    myState = MyState.loading;

    try {
      _moduleList = await api.getModuleList();
      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }

  Future getSectionVideo() async {
    myState = MyState.loading;

    try {
      _detailVideo = await api.getSectionVideo();
      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }

  Future getSectionTask() async {
    myState = MyState.loading;

    try {
      _detailTask = await api.getSectionTask();
      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }
}
