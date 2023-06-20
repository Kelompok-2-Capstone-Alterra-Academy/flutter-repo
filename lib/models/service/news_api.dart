import 'package:dio/dio.dart';
import 'package:staredu/utils/constant/news_list.dart';

import '../news_model.dart';

class NewsAPI {
  final Dio dio = Dio();

  static Future<List<NewsModel>> getNews() async {
    final List<NewsModel> data = [
      NewsModel(
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

  Future<List<NewsModel>> getAllNews() async {
    try {
      // List<SellCourseModel> listSellCourse = [];
      // final response = await dio.get();

      // for (var element in response.data) {
      //   listSellCourse.add(SellCourseModel.fromJson(element));
      // }
      return newsList;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
