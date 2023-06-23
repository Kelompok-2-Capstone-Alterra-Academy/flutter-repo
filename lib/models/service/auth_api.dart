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

  static Future<dynamic> verifyOtp(String email, String otp) async {
    final response = Dio().post(
      '$BASE_URL_API/verify-otp',
      data: {
        'email': email,
        'otp': otp,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  static Future<dynamic> login(String email, String password) async {
    final response = Dio().post(
      '$BASE_URL_API/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  static Future<dynamic> forgotPassword(String email) async {
    final response = Dio().post(
      '$BASE_URL_API/forgot-password',
      data: {
        'email': email,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  static Future<dynamic> resetPassword(
    String token,
    String otp,
    String password,
  ) async {
    final response = Dio().post(
      '$BASE_URL_API/students/new-password',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        'token': otp,
        'password': password,
        'repassword': password,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }
}
