import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/constant/sell_course_list.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/screen/history/history_transaction_screen.dart';
import '../../../utils/color/color.dart';
import '../../../widgets/sell_course/detail_payment.dart';

class CoursePaymentScreen extends StatefulWidget {
  static const String routeName = "/course_payment";

  final int indexSellCourse;

  const CoursePaymentScreen({super.key, required this.indexSellCourse});

  @override
  State<CoursePaymentScreen> createState() => _CoursePaymentScreenState();
}

class _CoursePaymentScreenState extends State<CoursePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isChecked = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengambilan Kursus",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Detail Pengambilan Kursus",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: lightBlueColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      DetailKursus(
                        icon: Icons.menu_book,
                        title: "Nama Kursus",
                        subtitle: sellCourses[widget.indexSellCourse].title!,
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.school_outlined,
                        title: "Jenjang",
                        subtitle: "SMA/SMK Kelas 12",
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.apps,
                        title: "Section",
                        subtitle: "10 Section",
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.laptop,
                        title: "Live Session",
                        subtitle: "3x Seminggu",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: screenWidth,
                height: 52,
                decoration: const BoxDecoration(
                  color: searchBarColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.verified_outlined,
                        color: searchBarTextColor,
                        size: 18,
                      ),
                      const SizedBox(width: 11),
                      Text(
                        "Gunakan Vouchermu Sekarang!",
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: searchBarTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: lightBlueColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      DetailKursus(
                        icon: Icons.payments_outlined,
                        title: "Harga",
                        subtitle: sellCourses[widget.indexSellCourse].price!,
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.payments_rounded,
                        title: "Biaya Admin",
                        subtitle: "Rp. 500",
                      ),
                      const SizedBox(height: 15),
                      Divider(
                        color: primaryColor.withOpacity(0.3),
                        thickness: 2,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: greyColor2),
                          ),
                          Text(
                            "Rp. 750.000",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.25),
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
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 50),
                              SizedBox(
                                child: Image.asset(
                                    "assets/images/new_course_popup.png"),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                "Yeay, Kamu Punya Kursus Baru!",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: blackColor),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                textAlign: TextAlign.center,
                                "Pembayaran kamu sukses dan kamu bisa segera memulai pembelajaran",
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor),
                              ),
                              const SizedBox(height: 12),

                              //Button Lihat Modul
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
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animations,
                                                  secondaryAnimations) =>
                                              const CourseTakenListScreen(),
                                          transitionsBuilder: (context,
                                              animations,
                                              secondaryAnimations,
                                              childs) {
                                            final tween =
                                                Tween(begin: 0.0, end: 1.0);
                                            return FadeTransition(
                                              opacity: animations.drive(tween),
                                              child: childs,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 12),
                                      child: Center(
                                        child: Text(
                                          "Lihat Modul",
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
                              const SizedBox(height: 10),

                              //Button Riwayat Transaksi
                              Container(
                                height: 42,
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(color: primaryColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animations,
                                                  secondaryAnimations) =>
                                              const HistoryTransactionScreen(),
                                          transitionsBuilder: (context,
                                              animations,
                                              secondaryAnimations,
                                              childs) {
                                            final tween =
                                                Tween(begin: 0.0, end: 1.0);
                                            return FadeTransition(
                                              opacity: animations.drive(tween),
                                              child: childs,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 12),
                                      child: Center(
                                        child: Text(
                                          "Riwayat Transaksi",
                                          style: GoogleFonts.poppins(
                                              color: primaryColor,
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
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 12),
                      child: Center(
                        child: Text(
                          "Checkout",
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
