import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_video.dart';
import 'package:staredu/views/screen/course/module/module_detail_ppt.dart';
import 'package:staredu/views/screen/course/module/module_list.dart';

import '../../utils/color/color.dart';

class ModuleSectionCard extends StatelessWidget {
  const ModuleSectionCard({
    super.key,
    this.id,
    this.title,
    this.courseName,
    this.isVideoAvailable,
    this.isMaterialAvailable,
    this.isAssignmentAvailable,
    this.isSectionFinished,
  });

  final int? id;
  final String? title;
  final String? courseName;
  final bool? isVideoAvailable;
  final bool? isMaterialAvailable;
  final bool? isAssignmentAvailable;
  final bool? isSectionFinished;

  @override
  Widget build(BuildContext context) {
    int numbering = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "Section $id - $title",
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            color: const Color(0xff616161),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        isVideoAvailable!
            ? GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ModuleVideoScreen.routeName,
                      arguments: ModuleDetailVideoArguments(
                        courseName.toString(),
                        title.toString(),
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
                              "0$numbering",
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
                                        "Materi $courseName ",
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
                                                    fontWeight: FontWeight.w600,
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
                                                    fontWeight: FontWeight.w600,
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
        isMaterialAvailable!
            ? GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ModulDetailPPTScreen.routeName,
                  );
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
                              "0${numbering + 1}",
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
                                        "Materi $courseName ",
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
                onTap: () {},
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
                              isMaterialAvailable!
                                  ? "0${numbering + 2}"
                                  : "0${numbering + 1}",
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
                                        "Materi $courseName",
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
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
