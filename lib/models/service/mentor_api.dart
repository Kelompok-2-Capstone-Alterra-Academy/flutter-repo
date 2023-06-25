import 'package:dio/dio.dart';
import 'package:staredu/models/mentor_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';

class MentorAPI {
  final Dio dio = Dio();

  Future<List<MentorModel>> getMentor(String? token) async {
    try {
      List<MentorModel> listMentor = [];
      final response = await dio.get(
        '$BASE_URL_API/students/mentors',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      for (var element in response.data['data']) {
        listMentor.add(MentorModel.fromJson(element));
      }
      return listMentor;
    } on DioError catch (_) {
      rethrow;
    }
  }

  static Future<dynamic> getAllMentor(String? token) async {
    final response = Dio().get(
      '$BASE_URL_API/students/mentors',
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
}
