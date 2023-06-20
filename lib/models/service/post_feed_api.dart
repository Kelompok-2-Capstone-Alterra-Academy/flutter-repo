import 'package:dio/dio.dart';
import 'package:staredu/models/post_feed_model.dart';
import '../../utils/constant/list_post_feed.dart';

class PostFeedAPI {
  final Dio dio = Dio();

  static Future<List<PostFeedModel>> getPostFeed() async {
    final List<PostFeedModel> data = [
      PostFeedModel(
        name: 'Jung Jaehyun',
        time: '20 April 2023, 12:37',
        comment:
            'Lorem ipsum dolor sit amet consectetur. Et risus interdum nulla egestas rhoncus. Eu eget euismod sem ullamcorper eget sed.',
        like: '15',
        reply: '3',
      ),
      PostFeedModel(
        name: 'Jung Jaehyun',
        time: '20 April 2023, 12:37',
        comment:
            'Lorem ipsum dolor sit amet consectetur. Et risus interdum nulla egestas rhoncus. Eu eget euismod sem ullamcorper eget sed.',
        like: '15',
        reply: '3',
      ),
    ];

    return data;
  }

  Future<List<PostFeedModel>> getAllPostFeed() async {
    try {
      // final List<PostFeedModel> postFeedsList = await getAllPostFeed();
      // final response = await dio.get();

      // for (var element in response.data) {
      //   postFeedsList.add(PostFeedModel.fromJson(element));
      // }
      return postFeedsList;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
