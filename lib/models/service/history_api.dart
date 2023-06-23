import 'package:dio/dio.dart';
import 'package:staredu/models/course_history_model.dart';

import '../../utils/constant/constant.dart';

class HistoryAPI {
  final Dio dio = Dio();
  // late Dio _dio;
  // HistoryAPI() {
  //   _dio = Dio();

  Future<List<CourseHistoryModel>> getHistory(String? token) async {
    try {
      List<CourseHistoryModel> listHistory = [];
      final response = await dio.get(
        '$BASE_URL_API/students/transaction/history',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      for (var element in response.data['data']["transaction"]) {
        listHistory.add(CourseHistoryModel.fromJson(element));
      }
      return listHistory;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
