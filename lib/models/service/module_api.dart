import 'package:dio/dio.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/module_details_model.dart';
import 'package:staredu/models/module_list_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';
import 'package:staredu/utils/constant/module_list.dart';

class ModuleApi {
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
          id: 1,
          courseId: 2,
          title: "Pengenalan courseId 2",
          video: true,
          material: false,
          assignment: true,
          quiz: false,
          finished: true),
      ModuleListModel(
        id: 2,
        courseId: 2,
        title: "List 2 courseId 2",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: true,
      ),
      ModuleListModel(
        id: 3,
        courseId: 2,
        title: "List 3 courseId 2",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: false,
      ),
      ModuleListModel(
          id: 1,
          courseId: 3,
          title: "Pengenalan courseId 3",
          video: true,
          material: false,
          assignment: true,
          quiz: false,
          finished: true),
      ModuleListModel(
        id: 2,
        courseId: 3,
        title: "List 2 courseId 3",
        video: true,
        material: true,
        assignment: true,
        quiz: true,
        finished: true,
      ),
      ModuleListModel(
        id: 3,
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

    // final List<DetailVideoModel> data = [
    //   DetailVideoModel(
    //     id: 1,
    //     sectionId: 1,
    //     courseId: 1,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 2,
    //     sectionId: 2,
    //     courseId: 1,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 3,
    //     sectionId: 3,
    //     courseId: 1,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 4,
    //     sectionId: 1,
    //     courseId: 2,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 5,
    //     sectionId: 2,
    //     courseId: 2,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 6,
    //     sectionId: 3,
    //     courseId: 2,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 7,
    //     sectionId: 1,
    //     courseId: 3,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 8,
    //     sectionId: 2,
    //     courseId: 3,
    //     link: 'MLpWrANjFbI',
    //   ),
    //   DetailVideoModel(
    //     id: 9,
    //     sectionId: 3,
    //     courseId: 3,
    //     link: 'MLpWrANjFbI',
    //   ),
    // ];
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
}
