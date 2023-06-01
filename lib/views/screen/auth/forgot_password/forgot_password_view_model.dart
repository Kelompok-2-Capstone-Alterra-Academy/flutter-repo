import 'package:flutter/material.dart';
import 'package:staredu/models/service/auth_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  dynamic response;
  MyState _stateForgotPassword = MyState.initial;
  MyState _stateOtp = MyState.initial;

  MyState get stateForgotPassword => _stateForgotPassword;
  MyState get stateOtp => _stateOtp;

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

  Future<String> verifyOtp(String email, String otp) async {
    response = await AuthAPI.verifyOtp(email, otp);

    if (response == null) {
      setStateOtp(MyState.failed);
      return 'Verify OTP Failed';
    }

    if (response['status_code'] == 200) {
      setStateOtp(MyState.success);
      return 'success';
    } else {
      setStateOtp(MyState.failed);
      return response['message'];
    }
  }

  void setStateForgotPassword(MyState state) {
    _stateForgotPassword = state;
    notifyListeners();
  }

  void setStateOtp(MyState state) {
    _stateOtp = state;
    notifyListeners();
  }
}
