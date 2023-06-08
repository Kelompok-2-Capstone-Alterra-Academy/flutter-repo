import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';
import 'package:staredu/widgets/course/filter_course_taken.dart';

import '../../utils/color/color.dart';

class OnGoingCourseTakenListScreen extends StatefulWidget {
  final CourseTakenViewModel viewModel;
  const OnGoingCourseTakenListScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<OnGoingCourseTakenListScreen> createState() =>
      _OnGoingCourseTakenListScreenState();
}

class _OnGoingCourseTakenListScreenState
    extends State<OnGoingCourseTakenListScreen> {
  @override
  Widget build(BuildContext context) {
    final onGoingCourse = [];
    for (var i = 0; i < widget.viewModel.courseTaken.length; i++) {
      if (widget.viewModel.courseTaken[i].progress! < 100) {
        onGoingCourse.add(widget.viewModel.courseTaken[i]);
      }
    }
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
                    itemCount: onGoingCourse.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animations, secondaryAnimations) =>
                                      ModuleListScreen(
                                courseName:
                                    onGoingCourse[index].title.toString(),
                                courseId: int.parse(onGoingCourse[index].id),
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
                                        AssetImage(onGoingCourse[index].img!),
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
                                        onGoingCourse[index].title!,
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
                                              onGoingCourse[index]
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
                                              onGoingCourse[index]
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
                                              animatedDuration: const Duration(
                                                milliseconds: 600,
                                              ),
                                              progressGradient:
                                                  const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  primaryColor,
                                                  secondaryColor,
                                                ],
                                              ),
                                              backgroundColor:
                                                  progressBarBackgroundColor,
                                              size: 10,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              currentValue:
                                                  onGoingCourse[index].progress,
                                              maxValue: 100,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            onGoingCourse[index]
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
