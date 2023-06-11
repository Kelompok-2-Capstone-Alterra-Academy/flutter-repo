import 'package:flutter/material.dart';
import 'package:staredu/models/service/profile_api.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/state/my_state.dart';

class EditProfileViewModel extends ChangeNotifier {
  User? response;
  MyState _state = MyState.initial;

  MyState get state => _state;

  Future<User?> updateUserDetail(User? user, String? token) async {
    try {
      response = await ProfileAPI.updateUserDetail(user, token);

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
