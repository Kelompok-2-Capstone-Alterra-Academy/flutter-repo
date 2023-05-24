import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/views/screen/course/module/module_detail_ppt.dart';
import 'package:staredu/views/screen/course/module/module_list.dart';

import '../../utils/color/color.dart';
import '../../utils/constant/list_course_taken.dart';

class OnGoingCourseTakenListScreen extends StatefulWidget {
  const OnGoingCourseTakenListScreen({super.key});

  @override
  State<OnGoingCourseTakenListScreen> createState() =>
      _OnGoingCourseTakenListScreenState();
}

class _OnGoingCourseTakenListScreenState
    extends State<OnGoingCourseTakenListScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    ModulDetailPPTScreen.routeName,
                  ),
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
                            padding: const EdgeInsets.only(left: 10, right: 18),
                            child: Image(
                              image: AssetImage(courseTaken[index].img!),
                              height: 70,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        courseTaken[index].currentSection!,
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
                                        courseTaken[index].totalSection!,
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
                                        progressGradient: const LinearGradient(
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
                                            courseTaken[index].progress!,
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
    );
  }
}
