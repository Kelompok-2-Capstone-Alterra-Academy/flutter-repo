import 'package:dio/dio.dart';
import 'package:staredu/models/course_history.dart';
import 'package:staredu/models/course_history_model.dart';
import '../../utils/constant/history_course_list.dart';

class HistoryAPI {
  final Dio dio = Dio();

  static Future<List<CourseHistory>> getAllHistory() async {
    final List<CourseHistory> data = [
      CourseHistory(id: 1, title: "Matematika"),
      CourseHistory(id: 2, title: "Bahasa Inggris"),
      CourseHistory(id: 3, title: "Geografi"),
      CourseHistory(id: 4, title: "Ekonomi"),
      CourseHistory(id: 5, title: "Sejarah Indonesia"),
    ];

    return data;
  }

  Future<List<CourseHistoryModel>> getHistory() async {
    try {
      // List<CourseHistoryModel> listSellCourse = [];
      // final response = await dio.get();

      // for (var element in response.data) {
      //   listSellCourse.add(CourseHistoryModel.fromJson(element));
      // }
      return historyCourses;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
