import 'package:flutter/material.dart';
import 'package:staredu/models/service/profile_api.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileViewModel extends ChangeNotifier {
  dynamic res;
  User? response;
  MyState _state = MyState.initial;

  MyState get state => _state;

  Future<User?> getUserDetail(String? email, String? token) async {
    try {
      Map<String, dynamic>? decodedToken = JwtDecoder.decode(token!);
      String? id = decodedToken!['id'].toString();
      res = await ProfileAPI.getUserDetail(id, token);
      if (res == null) {
        setState(MyState.failed); 
        return null;
      }
      response = User.fromJson(res['data']);
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
