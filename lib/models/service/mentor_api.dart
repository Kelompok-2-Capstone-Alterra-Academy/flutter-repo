import 'package:dio/dio.dart';
import 'package:staredu/models/mentor.dart';
import 'package:staredu/models/mentor_model.dart';
import 'package:staredu/utils/constant/mentor_list.dart';

class MentorAPI {
  final Dio dio = Dio();

  static Future<List<Mentor>> getAllMentor() async {
    final List<Mentor> data = [
      Mentor(id: 1, name: 'Jacob', image: 'link'),
      Mentor(id: 2, name: 'Clarie', image: 'link'),
      Mentor(id: 3, name: 'Prisillia', image: 'link'),
      Mentor(id: 1, name: 'Johny', image: 'link'),
      Mentor(id: 2, name: 'Willy', image: 'link')
    ];

    return data;
  }

  Future<List<MentorModel>> getMentor() async {
    try {
      // List<SellCourseModel> listSellCourse = [];
      // final response = await dio.get();

      // for (var element in response.data) {
      //   listSellCourse.add(SellCourseModel.fromJson(element));
      // }
      return mentorList;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
