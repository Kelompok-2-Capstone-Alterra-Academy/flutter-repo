import 'package:staredu/models/type_course.dart';
import 'package:dio/dio.dart';
import 'package:staredu/models/sell_course_model.dart';
import 'package:staredu/models/voucher_model.dart';
import 'package:staredu/utils/constant/sell_course_list.dart';
import 'package:staredu/utils/constant/voucher_list.dart';

class CourseAPI {
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

  Future<List<SellCourseModel>> getCourseForSale() async {
    try {
      // List<SellCourseModel> listSellCourse = [];
      // final response = await dio.get();

      // for (var element in response.data) {
      //   listSellCourse.add(SellCourseModel.fromJson(element));
      // }
      return sellCourses;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<List<VoucherModel>> getCourseVoucher() async {
    try {
      // List<SellCourseModel> listSellCourse = [];
      // final response = await dio.get();

      // for (var element in response.data) {
      //   listSellCourse.add(SellCourseModel.fromJson(element));
      // }
      return voucherList;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
