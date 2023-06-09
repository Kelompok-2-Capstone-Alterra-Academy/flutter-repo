import 'package:dio/dio.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';
import 'package:staredu/utils/constant/user_mock.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';

class ProfileAPI {
  static Future<User> getUserDetail(String? email, String? token) async {
    // final response = Dio().get(
    //   '$BASE_URL_API/user/$email',
    //   options: Options(
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //     },
    //   ),
    // );
    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    return userMock;
  }

  static Future<User> updateUserDetail(User? user, String? token) async {
    // final response = Dio().put('$BASE_URL_API/user/${user?.email}',
    //     options: Options(headers: {
    //       'Authorization': 'Bearer $token',
    //     }),
    //     data: user?.toJson());
    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    return userMock;

  }
}
