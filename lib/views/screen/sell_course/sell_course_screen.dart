import 'package:animated_snack_bar/animated_snack_bar.dart';
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
import '../../view_model/course/course_taken_view_model.dart';

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
                                    if (context
                                        .read<CourseTakenViewModel>()
                                        .inProgressCourseTaken
                                        .isEmpty) {
                                      Navigator.of(context).push(FadeAnimation2(
                                          page: SellCourseDetailScreen(
                                        id: value.findCourse[index].id!,
                                        thumbnail:
                                            value.findCourse[index].thumbnail!,
                                        courseName:
                                            value.findCourse[index].courseName!,
                                        rating: value.findCourse[index].scores!,
                                        student: value
                                            .findCourse[index].numStudents!,
                                        price: value.findCourse[index].price!
                                                .isEmpty
                                            ? "700000"
                                            : value.findCourse[index].price!,
                                        grade: value.findCourse[index]
                                            .sellCourseModelClass!.className!,
                                        liveSession: value
                                            .findCourse[index].liveSessionWeek!,
                                        description: value
                                            .findCourse[index].description!,
                                      )));
                                      print('Masih Kosong');
                                    } else {
                                      for (var element in context
                                          .read<CourseTakenViewModel>()
                                          .inProgressCourseTaken) {
                                        if (element.id ==
                                            value.findCourse[index].id) {
                                          value.findCourse[index].isBuy = true;
                                          print(value.findCourse[index].isBuy);
                                        }
                                      }
                                      if (value.findCourse[index].isBuy ==
                                              false ||
                                          value.findCourse[index].isBuy ==
                                              null) {
                                        Navigator.of(context)
                                            .push(FadeAnimation2(
                                                page: SellCourseDetailScreen(
                                          id: value.findCourse[index].id!,
                                          thumbnail: value
                                              .findCourse[index].thumbnail!,
                                          courseName: value
                                              .findCourse[index].courseName!,
                                          rating:
                                              value.findCourse[index].scores!,
                                          student: value
                                              .findCourse[index].numStudents!,
                                          price: value.findCourse[index].price!
                                                  .isEmpty
                                              ? "700000"
                                              : value.findCourse[index].price!,
                                          grade: value.findCourse[index]
                                              .sellCourseModelClass!.className!,
                                          liveSession: value.findCourse[index]
                                              .liveSessionWeek!,
                                          description: value
                                              .findCourse[index].description!,
                                        )));
                                        print('Masih Kosong');
                                      } else {
                                        AnimatedSnackBar.material(
                                                'Kamu Sudah Membeli Course Ini',
                                                type: AnimatedSnackBarType.info,
                                                snackBarStrategy:
                                                    RemoveSnackBarStrategy())
                                            .show(context);
                                        print('udah Ada');
                                        print(value.findCourse[index].isBuy);
                                      }
                                    }
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
                                                value.findCourse[index]
                                                            .thumbnail!.length >
                                                        15
                                                    ? "assets/images/thumbnail/pencil.png"
                                                    : "assets/images/thumbnail/${value.findCourse[index].thumbnail!}.png",
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
                                                  value.findCourse[index].price!
                                                          .isEmpty
                                                      ? "Rp. " "700000"
                                                      : "Rp. ${value.findCourse[index].price!}",
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
                                                      value.findCourse[index]
                                                          .scores!
                                                          .toString(),
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
                                                      "${value.findCourse[index].numStudents!.toString()} Siswa",
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
