import 'package:dio/dio.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/module_details_model.dart';
import 'package:staredu/models/module_list_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';
import 'package:staredu/utils/constant/module_list.dart';

class ModuleApi {
  Dio dio = Dio();

  Future<List<NewCourseDetailModel>> getAllModule(
      String? token, int? id) async {
    try {
      List<NewCourseDetailModel> courseModule = [];
      final response =
          await dio.get('$BASE_URL_API/students/courses/section/$id',
              options: Options(
                headers: {'Authorization': 'Bearer $token'},
              ));
      for (var element in response.data['data']) {
        courseModule.add(NewCourseDetailModel.fromJson(element));
      }
      return courseModule;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<dynamic> getAllModule2(String? token, int? id) async {
    try {
      final response = dio.get('$BASE_URL_API/students/courses/section/$id',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      return response
          .then((value) => value.data)
          .catchError((e) => handleErrorApi(e));
    } on DioError catch (_) {
      rethrow;
    }
  }
}