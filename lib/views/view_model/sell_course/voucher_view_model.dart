import 'package:flutter/material.dart';
import 'package:staredu/models/voucher_model.dart';
import 'package:staredu/utils/constant/claimed_voucher_list.dart';
import '../../../models/service/course_api.dart';
import '../../../utils/state/my_state.dart';

class VoucherViewModel extends ChangeNotifier {
  List<VoucherModel> _courseVoucher = [];
  List<VoucherModel> get courseVoucher => _courseVoucher;

  final CourseAPI courseAPI = CourseAPI();

  MyState myState = MyState.initial;

  Future getAllVoucher(String? token) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _courseVoucher = await courseAPI.getCourseVoucher(token);

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }

  void claimVoucher(int index) {
    courseVoucher[index].isClaim = true;
    claimedVoucherList.add(VoucherModel(
      id: courseVoucher[index].id,
      thumbnail: courseVoucher[index].thumbnail,
      promoName: courseVoucher[index].promoName,
      expiredDate: courseVoucher[index].expiredDate,
      description: courseVoucher[index].description,
      totalPromo: courseVoucher[index].totalPromo,
    ));
    notifyListeners();
  }
}
