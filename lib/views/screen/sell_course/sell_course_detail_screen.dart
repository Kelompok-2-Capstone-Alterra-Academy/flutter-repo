import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/sell_course_list.dart';

import '../../../widgets/sell_course/detail_keuntungan.dart';

class SellCourseDetailScreen extends StatefulWidget {
  final int indexSellCourse;

  const SellCourseDetailScreen({super.key, required this.indexSellCourse});

  @override
  State<SellCourseDetailScreen> createState() => _SellCourseDetailScreenState();
}

class _SellCourseDetailScreenState extends State<SellCourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Kursus",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth,
                child: Image.asset(
                  "assets/images/banner_course.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sellCourses[widget.indexSellCourse].title!,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.bookmark_border,
                    size: 35,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: warningColor,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    sellCourses[widget.indexSellCourse].rating!,
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
                    sellCourses[widget.indexSellCourse].student!,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: searchBarTextColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                sellCourses[widget.indexSellCourse].price!,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Tentang Kursus",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Dengan mengambil kursus ini dapat membuat kamu lebih memahami materi pelajaran dengan adanya video yang menarik, rangkuman pelajaran dan sesi tanya jawab dengan mentor",
                style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: searchBarTextColor),
              ),
              const SizedBox(height: 24),
              Text(
                "Keuntungan yang akan didapat:",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              const DetailKeuntungan(
                iconImg: "assets/images/live_session_icon.png",
                text: "Live session 3x seminggu",
              ),
              const SizedBox(height: 15),
              const DetailKeuntungan(
                iconImg: "assets/images/video_icon.png",
                text: "Akses video tak terbatas",
              ),
              const SizedBox(height: 15),
              const DetailKeuntungan(
                iconImg: "assets/images/chat_icon.png",
                text: "Sesi tanya jawab tidak terbatas",
              ),
              const SizedBox(height: 15),
              const DetailKeuntungan(
                iconImg: "assets/images/copy_icon.png",
                text: "Rangkuman materi",
              ),
              const SizedBox(height: 40),
              Container(
                height: 42,
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 12),
                      child: Center(
                        child: Text(
                          "Ambil Kursus",
                          style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
