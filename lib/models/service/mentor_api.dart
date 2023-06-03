import 'package:staredu/models/mentor.dart';

class MentorAPI {
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
}
