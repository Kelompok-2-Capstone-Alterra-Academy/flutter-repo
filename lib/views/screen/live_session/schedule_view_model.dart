import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/service/schedule_api.dart';
import 'package:staredu/models/schedule_model.dart';
import 'package:staredu/utils/state/my_state.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<ScheduleCourseModel> _scheduleList = [];
  List<ScheduleCourseModel> get scheduleList => _scheduleList;

  List<ScheduleCourseModel> _filteredList = [];
  List<ScheduleCourseModel> get filteredList => _filteredList;
  set filteredList(List<ScheduleCourseModel> value) {
    _filteredList = value;
    notifyListeners();
  }

  final ScheduleAPI scheduleAPI = ScheduleAPI();

  MyState myState = MyState.initial;

  Future<void> getAllSchedule() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _scheduleList = await scheduleAPI.getAllSchedule();
      _filteredList = _scheduleList;

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
