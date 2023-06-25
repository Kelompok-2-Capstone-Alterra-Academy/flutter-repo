import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/service/news_api.dart';
import '../../../models/news_model.dart';
import '../../../utils/state/my_state.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsModel> _newsList = [];
  List<NewsModel> get newsList => _newsList;
  final NewsAPI newsAPI = NewsAPI();
  MyState myState = MyState.initial;

  Future<void> getAllNews(String? token) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      _newsList = await newsAPI.getAllNews(token);

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
}
