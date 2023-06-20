import 'dart:io';

import 'package:dio/dio.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/type_course.dart';
import 'package:dio/dio.dart';
import 'package:staredu/models/sell_course_model.dart';
import 'package:staredu/models/voucher_model.dart';
import 'package:staredu/utils/constant/sell_course_list.dart';

import '../../utils/constant/constant.dart';
import '../../utils/constant/helper.dart';

class CourseAPI {
  Dio dio = Dio();

  static Future<List<TypeCourse>> getTypeCourse() async {
    // TODO change data to data from API
    final List<TypeCourse> data = [
      TypeCourse(id: 1, name: 'Matematika'),
      TypeCourse(id: 2, name: 'Sejarah'),
      TypeCourse(id: 3, name: 'Sosiologi'),
      TypeCourse(id: 4, name: 'Kimia'),
      TypeCourse(id: 5, name: 'Biologi'),
      TypeCourse(id: 6, name: 'Ekonomi'),
      TypeCourse(id: 7, name: 'Geografi'),
    ];
    return data;
  }

  Future<List<SellCourseModel>> getCourseForSale(String? token) async {
    try {
      List<SellCourseModel> listCourse = [];
      final response = await dio.get(
        '$BASE_URL_API/students/courses',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      for (var element in response.data['data']) {
        listCourse.add(SellCourseModel.fromJson(element));
      }
      return listCourse;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<List<VoucherModel>> getCourseVoucher(String? token) async {
    try {
      List<VoucherModel> listVoucher = [];
      final response = await dio.get(
        '$BASE_URL_API/students/promos',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      for (var element in response.data['data']) {
        listVoucher.add(VoucherModel.fromJson(element));
      }
      return listVoucher;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<dynamic> payment(
      int price, String courseId, int totalPayment, String token) async {
    final response = dio.post(
      '$BASE_URL_API/students/transaction',
      data: {
        'price': price,
        'course_id': courseId,
        'total_payment': totalPayment,
        'admin_fees': 1000,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  Future<dynamic> getCourseTaken(String token) async {
    final Dio dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = dio.get("$BASE_URL_API/students/courses/status");

    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  Future<dynamic> sendTask({
    required token,
    required String moduleId,
    required String filePath,
    String? notes,
  }) async {
    final Dio dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';

    FormData formData = FormData();

    formData.files.add(MapEntry(
      'submission_source',
      await MultipartFile.fromFile(filePath),
    ));

    formData.fields.add(
      MapEntry('module_id', moduleId),
    );

    formData.fields.add(
      MapEntry('notes', notes ?? ""),
    );

    final response = dio.post(
      "$BASE_URL_API/students/courses/submission",
      data: formData,
    );

    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  Future<dynamic> sendReview(
      String token, int courseId, int rating, String notes) {
    final Dio dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = dio.post("$BASE_URL_API/students/rate-course", data: {
      'course_id': courseId,
      'rating': rating,
      'comment': notes,
    });

    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }
}
