import 'package:flutter/material.dart';
import 'package:staredu/models/service/auth_api.dart';
import 'package:staredu/utils/state/my_state.dart';

class RegisterViewModel extends ChangeNotifier {
  dynamic response;
  MyState _state = MyState.initial;

  MyState get state => _state;

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
    print('response');
    print(response);
    if (response == null) {
      setState(MyState.failed);
      return 'Register Failed';
    }

    if (response['status_code'] == 201) {
      setState(MyState.success);
      return 'success';
    } else {
      setState(MyState.failed);
      return response['message'];
    }
  }

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }
}
