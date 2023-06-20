import 'package:flutter/material.dart';
import 'package:staredu/models/service/profile_api.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/state/my_state.dart';

class EditProfileViewModel extends ChangeNotifier {
  dynamic res;
  User? response;
  MyState _state = MyState.initial;

  MyState get state => _state;

  Future<User?> updateUserDetail(User? user, String? token, int? id) async {
    try {
      res = await ProfileAPI.updateUserDetail(user, token, id);
      if (res == null) {
        setState(MyState.failed);
        return null;
      }
      response = User.fromJson(res);
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
