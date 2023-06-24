import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import '../../utils/animation/fade_animation2.dart';
import '../../utils/color/color.dart';

class CardCourseTaken extends StatefulWidget {
  const CardCourseTaken({
    super.key,
    required this.id,
    required this.title,
    required this.img,
  });

  final int id;
  final String title;
  final String img;

  @override
  State<CardCourseTaken> createState() => _CardCourseTakenState();
}

class _CardCourseTakenState extends State<CardCourseTaken> {
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

  @override
  Widget build(BuildContext context) {
    final currentSection = getCurrentSection(widget.id.toString());
    final totalSection = getSectionCount(widget.id.toString());
    final currentProgress = getProgress(widget.id.toString());
    return InkWell(
      onTap: () {
        Navigator.of(context).push(FadeAnimation2(
          page: ModuleListScreen(
            courseName: widget.title.toString(),
            courseFinished: false,
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
                child: widget.img.isEmpty ||
                        widget.img == 'noimage.png' ||
                        !widget.img.contains('http')
                    ? Image(
                        image: AssetImage(
                            'assets/images/thumbnail/${widget.img}.png'),
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: NetworkImage(widget.img),
                        fit: BoxFit.cover,
                      ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                                FutureBuilder(
                                  future: currentSection,
                                  builder: (context, currSection) {
                                    return Text(
                                      currSection.data.toString(),
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    );
                                  },
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
                                  snapshot.data?.toString() ?? "0",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Text(
                          "Kursus Baru !",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            color: successColor,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    FutureBuilder(
                      future: currentProgress,
                      builder: (context, progress) {
                        return Row(
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
                                backgroundColor: progressBarBackgroundColor,
                                size: 10,
                                borderRadius: BorderRadius.circular(100),
                                currentValue: progress.data ?? 0,
                                maxValue: 100,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              (progress.data ?? 0).toInt().toString(),
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
  }
}
