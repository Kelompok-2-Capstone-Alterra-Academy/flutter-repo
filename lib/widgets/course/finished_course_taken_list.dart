import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';
import 'package:staredu/widgets/course/filter_course_taken.dart';

import '../../utils/color/color.dart';
import '../../utils/constant/list_course_taken.dart';

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
    final finishedCourse = widget.viewModel.courseTaken
        .where((course) => course.progress == 100)
        .toList();
    return SingleChildScrollView(
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
            widget.viewModel.courseTaken.isNotEmpty
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: finishedCourse.length,
                    itemBuilder: (context, index) {
                      return Card(
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 18),
                                child: Image(
                                  image: AssetImage(finishedCourse[index].img!),
                                  height: 70,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      finishedCourse[index].title!,
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
                                            finishedCourse[index].score!,
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
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xffE1EFE1),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 4),
                                      child: Text(
                                        finishedCourse[index]
                                                    .certificateStatus ??
                                                true
                                            ? 'Mendapat Sertifikat'
                                            : 'Tidak Mendapat Sertifikat',
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
                                  value: finishedCourse[index].progress!,
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: progressBarBackgroundColor,
                                      borderRadius: BorderRadius.circular(150),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${finishedCourse[index].progress.toString()}%",
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
    );
  }
}
