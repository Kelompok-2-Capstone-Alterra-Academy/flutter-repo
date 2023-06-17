import 'package:flutter/material.dart';
import '../../../models/service/course_api.dart';
import '../../../utils/state/my_state.dart';

class CoursePaymentViewModel extends ChangeNotifier {
  dynamic response;
  String? tokens;

  final CourseAPI courseAPI = CourseAPI();

  MyState myState = MyState.initial;

  Future<String> payment(
      int price, String courseId, int totalPayment, String token) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      response = await courseAPI.payment(price, courseId, totalPayment, token);

      myState = MyState.success;
      notifyListeners();

      if (response == null) {
        stateSet(MyState.failed);
        return 'Payment Failed';
      }
      if (response["redirectURL"] != null) {
        stateSet(MyState.success);
        return 'success ${response["redirectURL"]}';
      } else {
        stateSet(MyState.failed);
        return response['message'] ?? 'Payment Failed';
      }
    } catch (e) {
      stateSet(MyState.failed);
      return response["message"] ?? 'Login Failed';
    }
  }

  void stateSet(MyState myState) {
    myState = myState;
    notifyListeners();
  }

  void setToken(String token) {
    tokens = token;
    notifyListeners();
  }
}
