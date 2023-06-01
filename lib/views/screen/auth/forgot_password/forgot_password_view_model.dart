import 'package:flutter/material.dart';
import 'package:staredu/models/service/auth_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  dynamic response;
  MyState _stateForgotPassword = MyState.initial;

  MyState get stateForgotPassword => _stateForgotPassword;

  Future<String> forgotPassword(String email) async {
    response = await AuthAPI.forgotPassword(email);

    if (response == null) {
      setStateForgotPassword(MyState.failed);
      return 'Forgot Password Failed';
    }

    if (response['status_code'] == 201) {
      setStateForgotPassword(MyState.success);
      return 'success';
    } else {
      setStateForgotPassword(MyState.failed);
      return response['message'] ?? 'Request Forgot Password Failed';
    }
  }

  void setStateForgotPassword(MyState state) {
    _stateForgotPassword = state;
    notifyListeners();
  }
}
