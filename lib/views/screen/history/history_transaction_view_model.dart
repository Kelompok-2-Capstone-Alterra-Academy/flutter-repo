import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:staredu/models/course_history_model.dart';
import 'package:staredu/models/service/history_api.dart';
import '../../../models/service/profile_api.dart';
import '../../../models/user_model.dart';
import '../../../utils/state/my_state.dart';

class HistoryTransactionViewModel extends ChangeNotifier {
  dynamic res;
  User? response;

  List<CourseHistoryModel> _historyCourses = [];
  List<CourseHistoryModel> get historyCourses => _historyCourses;

  final HistoryAPI historyAPI = HistoryAPI();

  // void getAllHistory() async {
  //   _historyCourses = await History.getAllHistory();
  //   notifyListeners();
  // }
  MyState myState = MyState.initial;

  Future getHistory(String? token) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _historyCourses = await historyAPI.getHistory(token);

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

  Future<User?> getUserDetail(String? email, String? token) async {
    try {
      Map<String, dynamic>? decodedToken = JwtDecoder.decode(token!);
      String? id = decodedToken['id'].toString();
      res = await ProfileAPI.getUserDetail(id, token);
      if (res == null) {
        setState(MyState.failed);
        return null;
      }
      response = User.fromJson(res['data']);
      setState(MyState.success);
      return response;
    } catch (e) {
      setState(MyState.failed);
      return null;
    }
  }

  void setState(MyState state) {
    myState = state;
    notifyListeners();
  }
}
