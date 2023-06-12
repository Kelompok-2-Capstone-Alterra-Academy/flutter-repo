import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staredu/models/sell_course_model.dart';

class WishlistManager {
  static const _wishlistKey = 'wishlist';

  Future<List<SellCourseModel>> getWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final wishlistData = prefs.getStringList(_wishlistKey);

    if (wishlistData != null) {
      List<SellCourseModel> wishlist = [];
      for (String itemJson in wishlistData) {
        final itemMap = jsonDecode(itemJson);
        final item = SellCourseModel.fromJson(itemMap);
        wishlist.add(item);
      }
      return wishlist;
    }

    return [];
  }

  Future<void> addWishlistItem(int id, String img, String price, String rating,
      String student, String title, String grade) async {
    List<SellCourseModel> wishlist = await getWishlist();
    bool isCourseInWishlist = wishlist.any((item) => item.id == id);

    if (!isCourseInWishlist) {
      wishlist.add(SellCourseModel(
        id: id,
        img: img,
        price: price,
        rating: rating,
        student: student,
        title: title,
        grade: grade,
      ));
      await saveWishlist(wishlist);
    }
  }

  Future<void> removeWishlistItem(int id) async {
    List<SellCourseModel> wishlist = await getWishlist();
    wishlist.removeWhere((item) => item.id == id);
    await saveWishlist(wishlist);
  }

  Future<void> saveWishlist(List<SellCourseModel> wishlist) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlistData =
        wishlist.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_wishlistKey, wishlistData);
  }
}
