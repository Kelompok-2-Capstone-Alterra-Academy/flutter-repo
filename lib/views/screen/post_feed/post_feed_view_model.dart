import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:staredu/models/post_feed_model.dart';
import 'package:staredu/models/service/post_feed_api.dart';
import '../../../models/reply_model.dart';
import '../../../models/service/profile_api.dart';
import '../../../models/user_model.dart';
import '../../../utils/state/my_state.dart';

class PostFeedViewModel extends ChangeNotifier {
  List<PostFeedModel> postFeedsListProvider = [];
  List<PostFeedModel> get postFeedsList => postFeedsListProvider;
  List<ReplyModel> postRepliesList = [];
  dynamic res;
  User? response;

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

  Future<User?> getUserDetail(String? email, String? token) async {
    try {
      Map<String, dynamic>? decodedToken = JwtDecoder.decode(token!);
      String? id = decodedToken['id'].toString();
      res = await ProfileAPI.getUserDetail(id, token);
      if (res == null) {
        setState(MyState.failed);
        return null;
      }
      response = User.fromJson(res['data']);
      setState(MyState.success);
      return response;
    } catch (e) {
      setState(MyState.failed);
      return null;
    }
  }

  void setState(MyState state) {
    myState = state;
    notifyListeners();
  }

  void toggleLikeStatus(int index) {
    if (index >= 0 && index < postFeedsListProvider.length) {
      postFeedsListProvider[index].isLiked =
          !postFeedsListProvider[index].isLiked;
      notifyListeners();
    }
  }

  void addReply(ReplyModel reply) {
    postRepliesList.add(reply);
    notifyListeners();
  }
}
