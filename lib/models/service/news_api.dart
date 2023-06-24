import 'package:dio/dio.dart';
import 'package:staredu/models/news.dart';
import '../../utils/constant/constant.dart';
import '../news_model.dart';

class NewsAPI {
  final Dio dio = Dio();

  static Future<List<News>> getNews() async {
    final List<News> data = [
      News(
          title: "Kumpulan Ucapan Selamat Hari Pendidikan Nasional",
          portal: "kumparan",
          content:
              "Belajar adalah hiasan dalam kemakmuran, perlindungan dalam kesulitan dan tunjangan di masa tua. Belajarlah dari masa lalu.",
          img: "assets/images/news1.png",
          link:
              "https://kumparan.com/inspirasi-kata/16-contoh-ucapan-hari-pendidikan-nasional-2023-20K5WEEtmIS/1"),
    ];

    return data;
  }

  Future<List<NewsModel>> getAllNews(String? token) async {
    try {
      List<NewsModel> listNews = [];
      final response = await dio.get(
        '$BASE_URL_API/students/education_newses',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      for (var element in response.data['data']) {
        listNews.add(NewsModel.fromJson(element));
      }
      return listNews;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
