import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/course_taken_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/course/module/module_list.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';

class CourseTakenListScreen extends StatefulWidget {
  static const String routeName = "/coursetaken";
  const CourseTakenListScreen({super.key});

  @override
  State<CourseTakenListScreen> createState() => _CourseTakenListScreenState();
}

class _CourseTakenListScreenState extends State<CourseTakenListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          foregroundColor: blackColor,
          elevation: 0,
          title: Text(
            "Kursus Saya",
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                labelColor: primaryColor,
                unselectedLabelColor: blackColor,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    child: Text(
                      "Berlangsung",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Selesai",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                color: whiteColor,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Urutkan",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: courseTaken.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ModuleListScreen.routeName,
                                arguments: ModuleArguments(
                                  courseTaken[index].title.toString(),
                                  int.parse(courseTaken[index]
                                      .currentSection
                                      .toString()),
                                  int.parse(courseTaken[index]
                                      .totalSection
                                      .toString()),
                                ));
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                                right: 16,
                                bottom: 9,
                              ),
                              height: 88,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 18),
                                    child: Image(
                                      image:
                                          AssetImage(courseTaken[index].img!),
                                      height: 70,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          courseTaken[index].title!,
                                          style: GoogleFonts.poppins(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Section ",
                                                style: GoogleFonts.poppins(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                              ),
                                              Text(
                                                courseTaken[index]
                                                    .currentSection!,
                                                style: GoogleFonts.poppins(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                              ),
                                              Text(
                                                "/",
                                                style: GoogleFonts.poppins(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                courseTaken[index]
                                                    .totalSection!,
                                                style: GoogleFonts.poppins(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: FAProgressBar(
                                                progressGradient:
                                                    const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xff2196F3),
                                                    Color(0xff4161FF),
                                                  ],
                                                ),
                                                backgroundColor:
                                                    const Color(0xff0D47A1),
                                                size: 10,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                currentValue: courseTaken[index]
                                                    .progress!,
                                                maxValue: 100,
                                                direction: Axis.horizontal,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              courseTaken[index]
                                                  .progress!
                                                  .toInt()
                                                  .toString(),
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11,
                                              ),
                                            ),
                                            Text(
                                              " %",
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 2,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleArguments {
  final String title;
  final int currentSection;
  final int totalSection;

  ModuleArguments(this.title, this.currentSection, this.totalSection);
}
