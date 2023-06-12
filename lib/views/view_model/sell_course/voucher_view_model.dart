import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/voucher_model.dart';

import '../../../models/sell_course_model.dart';
import '../../../models/service/course_api.dart';
import '../../../utils/state/my_state.dart';

class VoucherViewModel extends ChangeNotifier {
  List<VoucherModel> _courseVoucher = [];
  List<VoucherModel> get courseVoucher => _courseVoucher;

  final CourseAPI courseAPI = CourseAPI();

  MyState myState = MyState.initial;

  Future getAllVoucher() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _courseVoucher = await courseAPI.getCourseVoucher();

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

  void claimVoucher(int index) {
    courseVoucher[index].isClaim = !courseVoucher[index].isClaim;
    notifyListeners();
  }
}
