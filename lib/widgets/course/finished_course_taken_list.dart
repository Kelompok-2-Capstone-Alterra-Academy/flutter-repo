import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/course/module/finished_module_list_screen.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';
import 'package:staredu/widgets/course/filter_course_taken.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

import '../../utils/color/color.dart';

class FinishedCourseTakenListScreen extends StatefulWidget {
  final CourseTakenViewModel viewModel;
  const FinishedCourseTakenListScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<FinishedCourseTakenListScreen> createState() =>
      _FinishedCourseTakenListScreenState();
}

class _FinishedCourseTakenListScreenState
    extends State<FinishedCourseTakenListScreen> {
  @override
  Widget build(BuildContext context) {
    final finishedCourse = widget.viewModel.completedCourseTaken;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            color: whiteColor,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: FilterCourseTaken(),
                ),
                const SizedBox(
                  height: 4,
                ),
                widget.viewModel.completedCourseTaken.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: finishedCourse.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animations,
                                          secondaryAnimations) =>
                                      FinishedModuleListScreen(
                                    courseName: finishedCourse[index]
                                        .courseName
                                        .toString(),
                                    courseId: (finishedCourse[index].id),
                                    courseFinished: true,
                                    courseScore: finishedCourse[index]
                                        .scores
                                        ?.toString(),
                                  ),
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  top: 8,
                                  right: 16,
                                  bottom: 9,
                                ),
                                height: 88,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 18),
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/thumbnail/${finishedCourse[index].thumbnail ?? "idea"}.png"),
                                        height: 70,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            finishedCourse[index].courseName ??
                                                "Course Name",
                                            style: GoogleFonts.poppins(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Nilai : ",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                Text(
                                                  finishedCourse[index]
                                                          .scores
                                                          ?.toString() ??
                                                      "A",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: const Color(0xffE1EFE1),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 28, vertical: 4),
                                            child: Text(
                                              "Mendapat Sertifikat",
                                              style: GoogleFonts.poppins(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9,
                                                color: certificateStatusColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: CircleProgressBar(
                                        foregroundColor: primaryColor,
                                        backgroundColor: searchBarColor,
                                        // value: finishedCourse[index].progress!,
                                        value: 100,
                                        child: Container(
                                          margin: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: progressBarBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(150),
                                          ),
                                          child: Center(
                                            child: Text(
                                              // "${finishedCourse[index].progress.toString()}%",
                                              "100%",
                                              style: GoogleFonts.poppins(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11,
                                                color: whiteColor,
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
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 2,
                          );
                        },
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.68,
                        color: whiteColor,
                        child: Center(
                          child: Text(
                            "Belum Ada Kursus !",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        Consumer<CourseTakenViewModel>(
          builder: (context, value, child) => value.state == MyState.loading
              ? const OpacityProgressComponent()
              : const SizedBox.shrink(),
        ),
        Consumer<CourseTakenViewModel>(
          builder: (context, value, child) => value.state == MyState.loading
              ? const CircularProgressComponent()
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
