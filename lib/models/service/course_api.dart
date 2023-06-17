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
      int price, String courseId, int totalPayment /*, String token*/) async {
    final response = dio.post(
      '$BASE_URL_API/students/transaction',
      data: {
        'price': price,
        'course_id': courseId,
        'total_payment': totalPayment,
        'admin_fees': 1000,
      },
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Impvbm9AZ21haWwuY29tIiwiZXhwIjoxNjg2OTkwMDg3LCJpZCI6MSwicm9sZSI6InN0dWRlbnRzIn0.MIyTUF-c4umSZBubuvjVBVcdlk5Rmo_CU5rR-Wnfcbw'
        },
      ),
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }
}
