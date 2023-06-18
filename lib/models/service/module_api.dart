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

  Future<List<ModuleListModel>> getModuleList() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));

    final List<ModuleListModel> data = [
      ModuleListModel(
          id: 1,
          courseId: 1,
          title: "Pengenalan courseId 1",
          video: true,
          material: false,
          assignment: true,
          quiz: false,
          finished: true),
      ModuleListModel(
        id: 2,
        courseId: 1,
        title: "List 2 courseId 1",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: true,
      ),
      ModuleListModel(
        id: 3,
        courseId: 1,
        title: "List 3 courseId 1",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: false,
      ),
      ModuleListModel(
          id: 4,
          courseId: 2,
          title: "Pengenalan courseId 2",
          video: true,
          material: false,
          assignment: true,
          quiz: false,
          finished: true),
      ModuleListModel(
        id: 5,
        courseId: 2,
        title: "List 2 courseId 2",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: true,
      ),
      ModuleListModel(
        id: 6,
        courseId: 2,
        title: "List 3 courseId 2",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: false,
      ),
      ModuleListModel(
          id: 7,
          courseId: 3,
          title: "Pengenalan courseId 3",
          video: true,
          material: false,
          assignment: true,
          quiz: false,
          finished: true),
      ModuleListModel(
        id: 8,
        courseId: 3,
        title: "List 2 courseId 3",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: true,
      ),
      ModuleListModel(
        id: 9,
        courseId: 3,
        title: "List 3 courseId 3",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: false,
      ),
    ];
    return data;
  }

  Future<List<DetailVideoModel>> getSectionVideo() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    final List<DetailVideoModel> data = [
      DetailVideoModel(
        link: 'MLpWrANjFbI',
        id: 1,
        sectionId: 1,
        courseId: 1,
      ),
      DetailVideoModel(
        link: 'MLpWrANjFbI',
        id: 1,
        sectionId: 2,
        courseId: 1,
      ),
    ];
    return data;
  }

  Future<List<DetailTaskModel>> getSectionTask() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    final List<DetailTaskModel> data = [
      DetailTaskModel(
        deskripsi:
            'Kerjakan Tugas Matematika Dasar pada dokumen dibawah ini. Jawaban di tulis tangan kemudian diFoto/discan dan kemudian diupload dalam bentuk pdf Nama file (no induk_nama_jenis latihan) ini make dummy api',
        id: 1,
        sectionId: 1,
        courseId: 1,
      ),
      DetailTaskModel(
        deskripsi:
            'Kerjakan Tugas Matematika Dasar pada dokumen dibawah ini. Jawaban di tulis tangan kemudian diFoto/discan dan kemudian diupload dalam bentuk pdf Nama file (no induk_nama_jenis latihan) ini make dummy api',
        id: 1,
        sectionId: 2,
        courseId: 1,
      ),
    ];
    return data;
  }

  Future<List<QuizModel>> getSectionQuiz() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    final List<QuizModel> data = [
      QuizModel(
        id: 1,
        sectionId: 1,
        courseId: 1,
      ),
      QuizModel(
        id: 2,
        sectionId: 2,
        courseId: 1,
      ),
      QuizModel(
        id: 3,
        sectionId: 3,
        courseId: 1,
      ),
      QuizModel(
        id: 4,
        sectionId: 4,
        courseId: 2,
      ),
      QuizModel(
        id: 5,
        sectionId: 5,
        courseId: 2,
      ),
      QuizModel(
        id: 6,
        sectionId: 6,
        courseId: 2,
      ),
      QuizModel(
        id: 7,
        sectionId: 7,
        courseId: 3,
      ),
      QuizModel(
        id: 8,
        sectionId: 8,
        courseId: 3,
      ),
      QuizModel(
        id: 9,
        sectionId: 9,
        courseId: 3,
      ),
    ];
    return data;
  }
}
