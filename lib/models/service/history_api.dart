import 'package:dio/dio.dart';
import 'package:staredu/models/course_history_model.dart';

class HistoryAPI {
  final Dio dio = Dio();
  late Dio _dio;
  HistoryAPI() {
    _dio = Dio();
  }

  Future<List<CourseHistoryModel>> getHistory(String? token) async {
    try {
      const String url =
          'http://3.26.234.145:8081/students/transaction/history';
      final response = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        final List datas = response.data["data"]["transaction"];
        print(datas);
        return datas.map((e) => CourseHistoryModel.fromJson(e)).toList();
      } else {
        throw "get history not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
