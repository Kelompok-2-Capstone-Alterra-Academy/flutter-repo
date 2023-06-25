import 'package:dio/dio.dart';
import 'package:staredu/models/new_module_list_model.dart';
import 'package:staredu/utils/constant/constant.dart';

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
