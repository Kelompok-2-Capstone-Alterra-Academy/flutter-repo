import 'package:flutter/material.dart';
import 'package:staredu/models/service/profile_api.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/state/my_state.dart';

class ProfileViewModel extends ChangeNotifier {
  User? response;
  MyState _state = MyState.initial;

  MyState get state => _state;

  Future<User?> getUserDetail(String? email, String? token) async {
    try {
      response = await ProfileAPI.getUserDetail(email, token);

      if (response == null) {
        setState(MyState.failed);
        return null;
      }
      setState(MyState.success);
      return response;
    } catch (e) {
      setState(MyState.failed);
      return null;
    }
  }

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }
}
