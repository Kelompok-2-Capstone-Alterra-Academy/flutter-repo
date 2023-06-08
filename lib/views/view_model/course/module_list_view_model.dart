import 'package:flutter/material.dart';
import 'package:staredu/models/module_list_model.dart';
import 'package:staredu/models/service/module_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class ModuleListViewModel with ChangeNotifier {
  List<ModuleListModel> _moduleList = [];
  List<ModuleListModel> get moduleList => _moduleList;

  final ModuleApi moduleApi = ModuleApi();

  MyState myState = MyState.initial;

  Future getModuleList() async {
    myState = MyState.loading;

    try {
      _moduleList = await ModuleApi.getModuleList();
      myState = MyState.success;
      print('success');
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }
}
