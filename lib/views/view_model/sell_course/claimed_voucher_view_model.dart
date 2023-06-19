import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/voucher_model.dart';
import '../../../models/service/course_api.dart';
import '../../../utils/state/my_state.dart';
import 'course_payment_view_model.dart';

class ClaimedVoucherViewModel extends ChangeNotifier {
  List<VoucherModel> _claimedVoucher = [];
  List<VoucherModel> get claimedVoucher => _claimedVoucher;

  bool activeVoucher = false;
  int indexVoucher = -1;

  final CourseAPI courseAPI = CourseAPI();

  MyState myState = MyState.initial;

  Future getAllClaimedVoucher() async {
    try {
      _claimedVoucher = await courseAPI.getClaimedVoucher();

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }

  void setActiveVoucher(int index, BuildContext context) {
    if (activeVoucher == false) {
      indexVoucher = index;
      claimedVoucher[index].promoUse = true;
      activeVoucher = true;
      context
          .read<CoursePaymentViewModel>()
          .discount(claimedVoucher[index].totalPromo!);
      notifyListeners();
    } else if (indexVoucher == index) {
      indexVoucher = -1;
      claimedVoucher[index].promoUse = false;
      activeVoucher = false;
      context
          .read<CoursePaymentViewModel>()
          .discount(claimedVoucher[index].totalPromo!);
      notifyListeners();
    } else {}
  }

  void nonActiveVoucher(int index) {}

  void setActive() {}
}
