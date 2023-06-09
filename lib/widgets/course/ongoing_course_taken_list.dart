import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';
import 'package:staredu/widgets/course/filter_course_taken.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

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
  //to get current section
  Future<int> getCurrentSection(String courseId) async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    int currentSection = preferencesUtils
            .getPreferencesInt('current_section_course_${courseId}_$email') ??
        0;
    return currentSection;
  }

  //to get total section
  Future<int> getSectionCount(String courseId) async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    int? totalSection = preferencesUtils
            .getPreferencesInt('total_section_course_${courseId}_$email') ??
        0;
    return totalSection;
  }

  Future<double> getProgress(String courseId) async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    int? currentSection = preferencesUtils
            .getPreferencesInt('current_section_course_${courseId}_$email') ??
        0;
    int? totalSection = preferencesUtils
            .getPreferencesInt('total_section_course_${courseId}_$email') ??
        0;

    if (currentSection != 0 && totalSection != 0) {
      return currentSection / totalSection * 100;
    } else {
      return 0;
    }
  }

  Future<bool> checkIfLastModule(String courseId) async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    int? currentSection = preferencesUtils
            .getPreferencesInt('current_section_course_${courseId}_$email') ??
        0;
    int? totalSection = preferencesUtils
            .getPreferencesInt('total_section_course_${courseId}_$email') ??
        0;

    if (totalSection - currentSection == 1) {
      return true;
    } else {
      return false;
    }
  }

  // reset section (for testing)
  // Future<void> removeSection(String courseId, String moduleId) async {
  //   PreferencesUtils preferencesUtils = PreferencesUtils();
  //   await preferencesUtils.init();

  //   String email = preferencesUtils.getPreferencesString("user_email") ?? "";

  //   preferencesUtils.savePreferencesInt(
  //       'total_section_course_${courseId}_$email', 12);
  //   // preferencesUtils
  //   //     .removePreferences('total_section_course_${courseId}_$email');
  //   // preferencesUtils
  //   //     .removePreferences('current_section_course_${courseId}_$email');
  //   preferencesUtils.savePreferencesInt(
  //       'current_section_course_${courseId}_$email', 10);
  //   preferencesUtils.removePreferences('${moduleId.toString()}_$email');
  // }

  // @override
  // void initState() {
  //   // implement initState
  //   super.initState();
  //   removeSection("63", "374");
  // }

  @override
  Widget build(BuildContext context) {
    final onGoingCourse = widget.viewModel.inProgressCourseTaken;

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
                widget.viewModel.inProgressCourseTaken.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: onGoingCourse.length,
                        itemBuilder: (context, index) {
                          final currentSection = getCurrentSection(
                              onGoingCourse[index].id.toString());
                          final totalSection = getSectionCount(
                              onGoingCourse[index].id.toString());
                          final currentProgress =
                              getProgress(onGoingCourse[index].id.toString());
                          final isLastModule = checkIfLastModule(
                              onGoingCourse[index].id.toString());
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animations,
                                      secondaryAnimations) {
                                    return FutureBuilder(
                                      future: isLastModule,
                                      builder: (context, snapshot) {
                                        if (snapshot.data != null) {
                                          return ModuleListScreen(
                                            isLastModule: snapshot.data,
                                            courseName: onGoingCourse[index]
                                                .courseName
                                                .toString(),
                                            courseId: (onGoingCourse[index].id),
                                            courseFinished: false,
                                          );
                                        } else {
                                          return ModuleListScreen(
                                            isLastModule: false,
                                            courseName: onGoingCourse[index]
                                                .courseName
                                                .toString(),
                                            courseId: (onGoingCourse[index].id),
                                            courseFinished: false,
                                          );
                                        }
                                      },
                                    );
                                  },
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
                                        image: AssetImage(
                                            "assets/images/thumbnail/${onGoingCourse[index].thumbnail ?? "idea"}.png"),
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
                                            onGoingCourse[index].courseName!,
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
                                                FutureBuilder(
                                                  future: totalSection,
                                                  builder: (context, snapshot) {
                                                    if (snapshot.data != 0) {
                                                      return Flexible(
                                                        fit: FlexFit.loose,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Section ",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                            FutureBuilder(
                                                              future:
                                                                  currentSection,
                                                              builder: (context,
                                                                  currSection) {
                                                                return Text(
                                                                  currSection
                                                                      .data
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            Text(
                                                              "/",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              snapshot.data
                                                                      ?.toString() ??
                                                                  "0",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                    return Text(
                                                      "Kursus Baru !",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11,
                                                        color: successColor,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          FutureBuilder(
                                            future: currentProgress,
                                            builder: (context, snapshot) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: FAProgressBar(
                                                      animatedDuration:
                                                          const Duration(
                                                        milliseconds: 600,
                                                      ),
                                                      progressGradient:
                                                          const LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          primaryColor,
                                                          secondaryColor,
                                                        ],
                                                      ),
                                                      backgroundColor:
                                                          progressBarBackgroundColor,
                                                      size: 10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      currentValue:
                                                          snapshot.data ?? 0,
                                                      maxValue: 100,
                                                      direction:
                                                          Axis.horizontal,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    (snapshot.data ?? 0)
                                                        .toInt()
                                                        .toString(),
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  Text(
                                                    " %",
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
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
