import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/sell_course_model.dart';
import 'package:staredu/views/screen/sell_course/course_voucher_screen.dart';
import 'package:staredu/views/screen/sell_course/sell_course_detail_screen.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constant/sell_course_list.dart';
import '../../../widgets/sell_course/filter_button.dart';
import '../../../widgets/sell_course/promo_button.dart';

class SellCourseScreen extends StatefulWidget {
  static const String routeName = "/sell_course";

  const SellCourseScreen({super.key});

  @override
  State<SellCourseScreen> createState() => _SellCourseScreenState();
}

class _SellCourseScreenState extends State<SellCourseScreen> {
  List<SellCourseModel> findCourse = [];

  @override
  void initState() {
    findCourse = sellCourses;
    super.initState();
  }

  //Fungsi untuk search kursus (belum di implementasikan ke provider)
  void searching(String enterKey) {
    List<SellCourseModel> results = [];
    if (enterKey.isEmpty) {
      results = sellCourses;
    } else {
      results = sellCourses
          .where((user) =>
              user.title!.toLowerCase().contains(enterKey.toLowerCase()))
          .toList();
    }
    setState(() {
      findCourse = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 75),
            Container(
              height: 42,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: searchBarColor,
              ),
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 11,
                ),
                cursorColor: greyColor,
                onChanged: (value) => searching(value),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mau belajar apa hari ini? Cari di sini",
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: searchBarTextColor,
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: searchBarTextColor,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  width: screenWidth,
                  text: "Pilih Kelas",
                  iconImg: "assets/images/filter_list.png",
                  bgColor: lightBlueColor,
                  borderColor: primaryColor,
                ),
                PromoButton(
                  width: screenWidth,
                  text: "Klaim Promo",
                  iconImg: "assets/images/check.png",
                  bgColor: lightGreenColor,
                  borderColor: successColor,
                  pages: const CourseVoucherScreen(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Flexible(
              child: findCourse.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: findCourse.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animations,
                                            secondaryAnimations) =>
                                        SellCourseDetailScreen(
                                            id: findCourse[index].id!,
                                            img: findCourse[index].img!,
                                            title: findCourse[index].title!,
                                            rating: findCourse[index].rating!,
                                            student: findCourse[index].student!,
                                            price: findCourse[index].price!),
                                    transitionsBuilder: (context, animations,
                                        secondaryAnimations, childs) {
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  child: Container(
                                    height: 80,
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
                                            findCourse[index].img!,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 31),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              findCourse[index].title!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            Text(
                                              findCourse[index].price!,
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
                                                  findCourse[index].rating!,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          searchBarTextColor),
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
                                                  findCourse[index].student!,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          searchBarTextColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      },
                    )
                  : Text(
                      'No results found',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
