import 'package:dio/dio.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/module_details_model.dart';
import 'package:staredu/models/module_list_model.dart';
import 'package:staredu/models/new_module_list_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';
import 'package:staredu/utils/constant/module_list.dart';

class ModuleApi {
  Dio dio = Dio();

  Future<List<NewModuleListModel>> getAllModule(String? token, int? id) async {
    try {
      List<NewModuleListModel> courseModule = [];
      final response =
          await dio.get('$BASE_URL_API/students/courses/section/$id',
              options: Options(
                headers: {'Authorization': 'Bearer $token'},
              ));
      for (var element in response.data['data']) {
        courseModule.add(NewModuleListModel.fromJson(element));
      }
      return courseModule;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
