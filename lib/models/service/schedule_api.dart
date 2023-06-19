import 'package:dio/dio.dart';
import 'package:staredu/utils/constant/list_schedule_course.dart';
import '../schedule_model.dart';

class ScheduleAPI {
  final Dio dio = Dio();
  Future<List<ScheduleCourseModel>> getSchedule() async {
    final List<ScheduleCourseModel> data = [
      ScheduleCourseModel(
        course: 'Matematika Dasar - Materi 2',
        date: 'Senin, 18 April 2023, 13:00 - 16:00',
        status: 'Sudah Ikut',
      ),
      ScheduleCourseModel(
        course: 'Matematika Dasar - Materi 2',
        date: 'Senin, 18 April 2023, 13:00 - 16:00',
        status: 'Sudah Ikut',
      ),
    ];
    return data;
  }

  Future<List<ScheduleCourseModel>> getAllSchedule() async {
    try {
      // List<ScheduleCourseModel> scheduleList = [];
      // final response = await dio.get();

      // for (var element in response.data) {
      //   scheduleList.add(ScheduleCourseModel.fromJson(element));
      // }
      return scheduleList;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
