import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/sell_course_model.dart';
import '../../../models/service/wishlist_manager.dart';
import '../../../utils/color/color.dart';
import '../sell_course/sell_course_detail_screen.dart';

class WishlistScreen extends StatefulWidget {
  static const String routeName = "/wishlist_screen";

  const WishlistScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  WishlistManager wishlistManager = WishlistManager();
  List<SellCourseModel> wishlistItems = [];

  @override
  void initState() {
    super.initState();
    getWishlistItems();
  }

  Future<void> getWishlistItems() async {
    List<SellCourseModel> wishlist = await wishlistManager.getWishlist();
    setState(() {
      wishlistItems = wishlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Wishlist',
            style: GoogleFonts.poppins(
                fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: blackColor),
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemCount: wishlistItems.length,
          itemBuilder: (context, index) {
            SellCourseModel item = wishlistItems[index];
            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animations, secondaryAnimations) =>
                        SellCourseDetailScreen(
                      id: wishlistItems[index].id!,
                      thumbnail: wishlistItems[index].thumbnail!,
                      courseName: wishlistItems[index].courseName!,
                      rating: wishlistItems[index].scores!,
                      student: wishlistItems[index].numStudents!,
                      price: wishlistItems[index].price!,
                      grade: wishlistItems[index].status!,
                      liveSession: wishlistItems[index].liveSessionWeek!,
                      description: wishlistItems[index].description!,
                    ),
                    transitionsBuilder:
                        (context, animations, secondaryAnimations, childs) {
                      final tween = Tween(begin: 0.0, end: 1.0);
                      return FadeTransition(
                        opacity: animations.drive(tween),
                        child: childs,
                      );
                    },
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Container(
                  height: 120,
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: whiteColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          "assets/images/thumbnail/${item.thumbnail!}.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 31),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.courseName!,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item.price!,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: warningColor,
                              ),
                              const SizedBox(width: 7),
                              Text(
                                item.scores!.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: searchBarTextColor),
                              ),
                              const SizedBox(width: 7),
                              Text(
                                "|",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Text(
                                "${item.numStudents!.toString()} Siswa",
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: searchBarTextColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 25,
                            width: 163,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  "Checkout",
                                  style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
