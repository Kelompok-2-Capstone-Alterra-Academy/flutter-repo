import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/sell_course/course_payment_screen.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';
import '../../../models/course_taken_model.dart';
import '../../../models/sell_course_model.dart';
import '../../../models/service/wishlist_manager.dart';
import '../../../utils/animation/slide_animation3.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../widgets/sell_course/detail_keuntungan.dart';
import '../../../widgets/sell_course/primary_button.dart';

class SellCourseDetailScreen extends StatefulWidget {
  static const String routeName = "/sell_course_detail";

  final int id;
  final String thumbnail;
  final String courseName;
  final String price;
  final double rating;
  final int student;
  final String grade;
  final String liveSession;
  final String description;

  const SellCourseDetailScreen({
    super.key,
    required this.courseName,
    required this.price,
    required this.rating,
    required this.student,
    required this.id,
    required this.thumbnail,
    required this.grade,
    required this.liveSession,
    required this.description,
  });

  @override
  State<SellCourseDetailScreen> createState() => _SellCourseDetailScreenState();
}

class _SellCourseDetailScreenState extends State<SellCourseDetailScreen> {
  late PreferencesUtils preferencesUtils;
  bool isWishlistSelected = false;
  WishlistManager wishlistManager = WishlistManager();

  Future<void> checkWishlistStatus() async {
    List wishlist = await wishlistManager.getWishlist();

    setState(() {
      isWishlistSelected = wishlist.any((item) => item.id == widget.id);
    });
  }

  @override
  void initState() {
    super.initState();
    checkWishlistStatus();
  }

  void toggleWishlistStatus() async {
    if (isWishlistSelected) {
      await wishlistManager.removeWishlistItem(widget.id);
    } else {
      await wishlistManager.addWishlistItem(
        widget.id,
        widget.thumbnail,
        widget.price,
        widget.rating,
        widget.student,
        widget.courseName,
        widget.grade,
        widget.liveSession,
        widget.description,
      );
    }

    setState(() {
      isWishlistSelected = !isWishlistSelected;
    });
  }

  @override
  void didUpdateWidget(covariant SellCourseDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkWishlistStatus();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    MoneyFormatter fmf = MoneyFormatter(
      amount: double.parse(widget.price),
      settings: MoneyFormatterSettings(
        symbol: 'Rp',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: '. ',
        fractionDigits: 0,
      ),
    );

    MoneyFormatterOutput fo = fmf.output;

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
              Stack(
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: Image.asset(
                      "assets/images/banner_course2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.38),
                      SizedBox(
                        height: 182,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 170,
                              child: Text(
                                widget.courseName,
                                style: const TextStyle(
                                  fontFamily: 'GlikerSemiBold',
                                  color: whiteColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              width: 170,
                              height: 22,
                              decoration: const BoxDecoration(
                                  color: yellowColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                child: Text(
                                  " Kelas ${widget.grade}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.courseName,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: toggleWishlistStatus,
                    child: Icon(
                      isWishlistSelected
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      size: 35,
                      color: isWishlistSelected ? Colors.blue : Colors.black,
                    ),
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
                    widget.rating.toString(),
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
                    "${widget.student.toString()} Siswa",
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: searchBarTextColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                fo.symbolOnLeft,
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
                widget.description.isEmpty || widget.description.length < 15
                    ? "Dengan mengambil kursus ini dapat membuat kamu lebih memahami materi pelajaran dengan adanya video yang menarik, rangkuman pelajaran dan sesi tanya jawab dengan mentor"
                    : widget.description,
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
              DetailKeuntungan(
                iconImg: "assets/images/live_session_icon.png",
                text: "Live session ${widget.liveSession}",
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
                    onTap: () {
                      Navigator.push(
                          context,
                          SlideAnimation3(
                            page: CoursePaymentScreen(
                              courseId: widget.id,
                              title: widget.courseName,
                              price: widget.price,
                              liveSession: widget.liveSession,
                            ),
                          ));
                    },
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
