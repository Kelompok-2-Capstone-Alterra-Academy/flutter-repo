import 'package:flutter/material.dart';
import 'package:staredu/models/service/auth_api.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';

class RegisterViewModel extends ChangeNotifier {
  dynamic response;
  MyState _stateRegister = MyState.initial;
  MyState _stateOtp = MyState.initial;

  MyState get stateRegister => _stateRegister;
  MyState get stateOtp => _stateOtp;

  Future<String> register(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    response = await AuthAPI.register(
      name,
      email,
      phoneNumber,
      password,
    );

    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    if (response == null) {
      setStateRegister(MyState.failed);
      return 'Register Failed';
    }

    if (response['status_code'] == 201) {
      await preferencesUtils.savePreferencesString('email', email);
      await preferencesUtils.savePreferencesString('name', name);
      setStateRegister(MyState.success);
      return 'success';
    } else {
      setStateRegister(MyState.failed);
      return response['message'];
    }
  }

  Future<String> verifyOtp(String email, String otp) async {
    response = await AuthAPI.verifyOtp(email, otp);

    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    if (response == null) {
      setStateOtp(MyState.failed);
      return 'Verify OTP Failed';
    }

    if (response['status_code'] == 200) {
      await preferencesUtils.savePreferencesBool('isLogin', true);
      setStateOtp(MyState.success);
      return 'success';
    } else {
      setStateOtp(MyState.failed);
      return response['message'];
    }
  }

  void setStateRegister(MyState state) {
    _stateRegister = state;
    notifyListeners();
  }

  void setStateOtp(MyState state) {
    _stateOtp = state;
    notifyListeners();
  }
}
