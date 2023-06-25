import 'package:flutter/material.dart';
import 'package:staredu/models/service/auth_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class LoginViewModel extends ChangeNotifier {
  dynamic response;
  MyState _state = MyState.initial;

  MyState get state => _state;

  Future<String> login(String email, String password) async {
    try {
      response = await AuthAPI.login(email, password);
      if (response == null) {
        setState(MyState.failed);
        return 'Login Failed';
      }
      if (response["data"]["token"] != null) {
        setState(MyState.success);
        return 'success ${response["data"]["token"]}';
      } else {
        setState(MyState.failed);
        return response['message'] ?? 'Login Failed';
      }
    } catch (e) {
      setState(MyState.failed);
      return response["message"] ?? 'Login Failed';
    }
  }

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }
}
