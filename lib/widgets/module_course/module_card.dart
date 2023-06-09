import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/ppt_model.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_video_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_ppt_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_task_screen.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';

import '../../utils/animation/fade_animation2.dart';
import '../../utils/color/color.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    super.key,
    this.id,
    this.sectionId,
    this.sectionName,
    this.courseName,
    this.moduleName,
    this.numbering,
    this.isVideoAvailable,
    this.isMaterialAvailable,
    this.isAssignmentAvailable,
    this.dueDate,
    this.isSectionFinished,
    this.linkModule,
    this.moduleDescription,
    required this.isLastModule,
    this.moduleId,
  });

  final int? id;
  final int? sectionId;
  final String? sectionName;
  final String? courseName;
  final String? moduleName;
  final int? numbering;
  final bool? isVideoAvailable;
  final bool? isMaterialAvailable;
  final bool? isAssignmentAvailable;
  final String? dueDate;
  final bool? isSectionFinished;
  final String? linkModule;
  final String? moduleDescription;
  final bool isLastModule;
  final int? moduleId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        isVideoAvailable!
            ? Consumer<ModuleListViewModel>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(FadeAnimation2(
                        page: ModuleVideoScreen(
                          isLastIndex: isLastModule,
                          courseId: id,
                          sectionId: sectionId,
                          courseName: courseName,
                          moduleName: moduleName,
                          sectionName: sectionName,
                          linkModule: linkModule,
                          description: moduleDescription,
                          moduleId: moduleId,
                          isFinished: isSectionFinished,
                        ),
                      ));
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        height: 62,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 62,
                              width: 62,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff2196F3),
                                      Color(0xff4161FF),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  numbering! < 10
                                      ? "0$numbering"
                                      : numbering.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: whiteColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, bottom: 11),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Materi $moduleName ",
                                            style: GoogleFonts.poppins(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "Video",
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.poppins(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "15 menit",
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.poppins(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9,
                                            ),
                                          ),
                                          isSectionFinished!
                                              ? Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: lightGreenColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(40),
                                                    ),
                                                  ),
                                                  height: 18,
                                                  width: 68,
                                                  child: Center(
                                                    child: Text(
                                                      "Selesai",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 9,
                                                        color: const Color(
                                                            0XFF388E3C),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: subjectColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(40),
                                                    ),
                                                  ),
                                                  height: 18,
                                                  width: 90,
                                                  child: Center(
                                                    child: Text(
                                                      "Belum Selesai",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 9,
                                                        color: const Color(
                                                            0XFFE65100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const SizedBox.shrink(),
        isMaterialAvailable!
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      FadeAnimation2(
                          page: ModulDetailPPTScreen(
                        courseId: id,
                        courseName: courseName,
                        isLastIndex: isLastModule,
                        moduleId: moduleId,
                        isFinished: isSectionFinished,
                        pptDetailModel: PPTDetailModel(
                          section: sectionName,
                          lesson: moduleDescription,
                          url: linkModule,
                        ),
                      )));
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    height: 62,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff2196F3),
                                  Color(0xff4161FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              numbering! < 10
                                  ? "0$numbering"
                                  : numbering.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Materi $moduleName ",
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "Materi",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "14 Slides",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9,
                                        ),
                                      ),
                                      isSectionFinished!
                                          ? Container(
                                              decoration: const BoxDecoration(
                                                color: lightGreenColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(40),
                                                ),
                                              ),
                                              height: 18,
                                              width: 68,
                                              child: Center(
                                                child: Text(
                                                  "Selesai",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9,
                                                    color:
                                                        const Color(0XFF388E3C),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: const BoxDecoration(
                                                color: subjectColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(40),
                                                ),
                                              ),
                                              height: 18,
                                              width: 90,
                                              child: Center(
                                                child: Text(
                                                  "Belum Selesai",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9,
                                                    color:
                                                        const Color(0XFFE65100),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        isAssignmentAvailable!
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).push(FadeAnimation2(
                    page: ModuleDetailTask(
                      isLastIndex: isLastModule,
                      courseId: id,
                      sectionId: sectionId,
                      courseName: courseName,
                      sectionName: sectionName,
                      linkModule: linkModule,
                      dueDate: dueDate,
                      description: moduleDescription,
                      moduleId: moduleId,
                      isFinished: isSectionFinished,
                    ),
                  ));
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    height: 62,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff2196F3),
                                  Color(0xff4161FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              numbering! < 10
                                  ? "0$numbering"
                                  : numbering.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Materi $moduleName",
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "Tugas",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Essay",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9,
                                        ),
                                      ),
                                      isSectionFinished!
                                          ? Container(
                                              decoration: const BoxDecoration(
                                                color: lightGreenColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(40),
                                                ),
                                              ),
                                              height: 18,
                                              width: 68,
                                              child: Center(
                                                child: Text(
                                                  "Selesai",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9,
                                                    color:
                                                        const Color(0XFF388E3C),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: const BoxDecoration(
                                                color: subjectColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(40),
                                                ),
                                              ),
                                              height: 18,
                                              width: 90,
                                              child: Center(
                                                child: Text(
                                                  "Belum Selesai",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9,
                                                    color:
                                                        const Color(0XFFE65100),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
