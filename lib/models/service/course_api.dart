import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/models/type_course.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';

class CourseAPI {
  static Future<List<TypeCourse>> getTypeCourse() async {
    // TODO change data to data from API
    final List<TypeCourse> data = [
      TypeCourse(id: 1, name: 'Matematika'),
      TypeCourse(id: 2, name: 'Sejarah'),
      TypeCourse(id: 3, name: 'Sosiologi'),
      TypeCourse(id: 4, name: 'Kimia'),
      TypeCourse(id: 5, name: 'Biologi'),
      TypeCourse(id: 6, name: 'Ekonomi'),
      TypeCourse(id: 7, name: 'Geografi'),
    ];
    return data;
  }

  Future<List<CourseTakenModel>> getCourseTaken() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    return courseTaken;
  }

  Future<dynamic> sendTask() async {
    // final response = await Dio().post(
    // data:{
    // });

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    return 'success';
  }

  Future<dynamic> sendReview() async {
    // final response = await Dio().post(
    // data:{
    // });

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    return 'success';
  }
}
