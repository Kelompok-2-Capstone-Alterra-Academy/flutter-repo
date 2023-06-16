import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/screen/sell_course/course_voucher_screen.dart';
import 'package:staredu/views/screen/sell_course/sell_course_detail_screen.dart';
import 'package:staredu/views/view_model/sell_course/sell_course_view_model.dart';
import '../../../utils/animation/fade_animation2.dart';
import '../../../utils/color/color.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../utils/state/my_state.dart';
import '../../../widgets/sell_course/filter_button.dart';
import '../../../widgets/sell_course/promo_button.dart';

class SellCourseScreen extends StatefulWidget {
  static const String routeName = "/sell_course";

  const SellCourseScreen({super.key});

  @override
  State<SellCourseScreen> createState() => _SellCourseScreenState();
}

class _SellCourseScreenState extends State<SellCourseScreen> {
  late PreferencesUtils preferencesUtils;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    String? token = preferencesUtils.getPreferencesString('token');

    if (context.mounted) {
      Provider.of<SellCourseViewModel>(context, listen: false)
          .getAllCourseForSale(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SellCourseViewModel>(context, listen: false);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 5),
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
                onChanged: (value) => provider.searching(value),
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
            Consumer<SellCourseViewModel>(builder: (context, value, _) {
              if (value.myState == MyState.loading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.blueAccent[100],
                ));
              } else if (value.myState == MyState.failed) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Oops, Something Went Wrong!',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        textAlign: TextAlign.center,
                        'Make Sure Internet is Connected.',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (value.myState == MyState.success) {
                return Flexible(
                  child: value.findCourse.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.findCourse.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(FadeAnimation2(
                                        page: SellCourseDetailScreen(
                                      id: value.findCourse[index].id!,
                                      thumbnail:
                                          value.findCourse[index].thumbnail!,
                                      courseName:
                                          value.findCourse[index].courseName!,
                                      // rating: value.findCourse[index]!,
                                      // student: value.findCourse[index].student!,
                                      rating: "4.9",
                                      student: "8945 Siswa",
                                      price: value.findCourse[index].price!,
                                      // grade: value.findCourse[index].grade!,
                                      grade: "Kelas 10",
                                      liveSession: value
                                          .findCourse[index].liveSessionWeek!,
                                    )));
                                  },
                                  child: Card(
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
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
                                                "assets/images/thumbnail/${value.findCourse[index].thumbnail!}.png",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            const SizedBox(width: 31),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value.findCourse[index]
                                                      .courseName!,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  value
                                                      .findCourse[index].price!,
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
                                                      // value.findCourse[index]
                                                      //     .rating!,
                                                      "4.9",
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 7),
                                                    Text(
                                                      // value.findCourse[index]
                                                      //     .student!,
                                                      "8945 Siswa",
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
                );
              } else {
                return const Center(
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
