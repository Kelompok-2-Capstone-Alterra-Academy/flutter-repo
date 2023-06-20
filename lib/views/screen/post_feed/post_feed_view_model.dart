import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/post_feed_model.dart';
import 'package:staredu/models/service/post_feed_api.dart';
import '../../../utils/state/my_state.dart';

class PostFeedViewModel extends ChangeNotifier {
  List<PostFeedModel> postFeedsListProvider = [];
  List<PostFeedModel> get postFeedsList => postFeedsListProvider;

  final PostFeedAPI postFeedAPI = PostFeedAPI();

  MyState myState = MyState.initial;

  Future<void> getAllPostFeed() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      postFeedsListProvider = await postFeedAPI.getAllPostFeed();

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
