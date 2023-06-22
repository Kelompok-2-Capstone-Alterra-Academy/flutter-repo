import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/mentor_model.dart';
import 'package:staredu/models/service/mentor_api.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/state/my_state.dart';

class MentorViewModel extends ChangeNotifier {
  List<MentorModel> _mentorList = [];
  List<MentorModel> get mentorList => _mentorList;

  List<MentorModel> _findMentor = [];
  List<MentorModel> get findMentor => _findMentor;

  final MentorAPI mentorAPI = MentorAPI();

  MyState myState = MyState.initial;

  Future getAllMentor(String token) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _mentorList = await mentorAPI.getMentor(token);
      _findMentor = _mentorList;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response?.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }

  void searchMentor(String enterKey) {
    List<MentorModel> results = [];
    if (enterKey.isEmpty) {
      results = _mentorList;
    } else {
      results = _mentorList
          .where((user) =>
              user.name!.toLowerCase().contains(enterKey.toLowerCase()))
          .toList();
    }
    _findMentor = results;
    notifyListeners();
  }

  launchWhatsapp(BuildContext context, String whatsapp) async {
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }
}
