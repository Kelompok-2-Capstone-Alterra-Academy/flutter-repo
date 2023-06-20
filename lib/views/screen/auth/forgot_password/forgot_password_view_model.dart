import 'package:flutter/material.dart';
import 'package:staredu/models/service/auth_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  dynamic response;
  MyState _stateForgotPassword = MyState.initial;
  MyState _stateOtp = MyState.initial;
  MyState _stateResetPassword = MyState.initial;

  MyState get stateForgotPassword => _stateForgotPassword;
  MyState get stateOtp => _stateOtp;
  MyState get stateResetPassword => _stateResetPassword;

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

    if (response["data"]["token"] != null) {
      setStateOtp(MyState.success);
      return 'success ${response["data"]["token"]}';
    } else {
      setStateOtp(MyState.failed);
      return response['message'] ?? 'Verify OTP Failed';
    }
  }

  Future<String> resetPassword(
      String token, String otp, String password) async {
    response = await AuthAPI.resetPassword(token, otp, password);

    if (response == null) {
      setStateResetPassword(MyState.failed);
      return 'Reset Password Failed';
    }

    if (response['status_code'] == 201) {
      setStateResetPassword(MyState.success);
      return 'success';
    } else {
      setStateResetPassword(MyState.failed);
      return response['message'] ?? 'Reset Password Failed';
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

  void setStateResetPassword(MyState state) {
    _stateResetPassword = state;
    notifyListeners();
  }
}
