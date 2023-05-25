import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/views/screen/sell_course/sell_course_detail_screen.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constant/sell_course_list.dart';
import '../../../widgets/sell_course/filter_button.dart';
import '../../../widgets/sell_course/promo_button.dart';

class SellCourseScreen extends StatefulWidget {
  const SellCourseScreen({super.key});

  @override
  State<SellCourseScreen> createState() => _SellCourseScreenState();
}

class _SellCourseScreenState extends State<SellCourseScreen> {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search_rounded,
                      color: searchBarTextColor,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Mau belajar apa hari ini? Cari di sini",
                      style: GoogleFonts.poppins(
                        color: searchBarTextColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
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
                ),
              ],
            ),
            const SizedBox(height: 35),
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: sellCourses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Container(
                          height: 115,
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
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
                                  sellCourses[index].img!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 31),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sellCourses[index].title!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    sellCourses[index].price!,
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
                                        sellCourses[index].rating!,
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
                                        sellCourses[index].student!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: searchBarTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    height: 18,
                                    width: 154,
                                    decoration: const BoxDecoration(
                                      color: subjectColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                              pageBuilder: (context, animations,
                                                      secondaryAnimations) =>
                                                  SellCourseDetailScreen(
                                                      indexSellCourse: index),
                                              transitionsBuilder: (context,
                                                  animations,
                                                  secondaryAnimations,
                                                  childs) {
                                                final tween =
                                                    Tween(begin: 0.0, end: 1.0);
                                                return FadeTransition(
                                                  opacity:
                                                      animations.drive(tween),
                                                  child: childs,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            "Lihat Detail Kursus",
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
