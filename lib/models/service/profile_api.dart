import 'package:dio/dio.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';

class ProfileAPI {
  static Future<dynamic> getUserDetail(String? id, String? token) async {
    final response = Dio().get(
      '$BASE_URL_API/students/users/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  static Future<dynamic> updateUserDetail(
      User? user, String? token, int? id) async {
    final response = Dio().put('$BASE_URL_API/students/user/profile/$id',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
        data: user?.toJson());

    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }
}
