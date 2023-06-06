import 'package:dio/dio.dart';
import 'package:staredu/models/sell_course_model.dart';
import 'package:staredu/utils/constant/sell_course_list.dart';

class SellCourseAPI {
  final Dio dio = Dio();

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
}
