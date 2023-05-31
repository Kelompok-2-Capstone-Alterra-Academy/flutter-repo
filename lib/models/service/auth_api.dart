import 'package:dio/dio.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';

class AuthAPI {
  static Future<dynamic> register(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    final response = Dio().post(
      '$BASE_URL_API/registrasi',
      data: {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }
}
