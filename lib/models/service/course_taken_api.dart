import 'package:dio/dio.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/utils/constant/constant.dart';
import 'package:staredu/utils/constant/helper.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';

class CourseTakenApi {
  Future<List<CourseTakenModel>> getCourseTaken() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    return courseTaken;
  }
}
