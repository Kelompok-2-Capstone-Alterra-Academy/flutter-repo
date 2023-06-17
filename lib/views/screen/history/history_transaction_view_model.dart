import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/course_history_model.dart';
import 'package:staredu/models/service/history_api.dart';

import '../../../utils/state/my_state.dart';

class HistoryTransactionViewModel extends ChangeNotifier {
  List<CourseHistoryModel> _historyCourses = [];
  List<CourseHistoryModel> get historyCourses => _historyCourses;

  final HistoryAPI historyAPI = HistoryAPI();

  // void getAllHistory() async {
  //   _historyCourses = await History.getAllHistory();
  //   notifyListeners();
  // }
  MyState myState = MyState.initial;

  Future getAllHistory() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _historyCourses = await historyAPI.getHistory();

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response?.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }
}
