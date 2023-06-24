import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/animation/fade_animation2.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/screen/course/module/module_list_quiz_screen.dart';

class ModuleQuizDetailDoneDialog extends StatelessWidget {
  final String? courseName;
  final int? courseId;
  final bool? courseStatus;
  const ModuleQuizDetailDoneDialog(
      {super.key, this.courseName, this.courseId, this.courseStatus});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 56,
            ),
            const Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/quiz_done.png'),
              width: 237,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Yeay, Quiz 1 Selesai",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: width / 1.4,
              child: Center(
                child: Text(
                  "Quiz 1 sudah dikerjakan, silahkan menyelesaikan quiz selanjutnya.",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: width / 1.4,
              height: width / 9,
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: whiteColor,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(FadeAnimation2(
                      page: ModuleListQuizScreen(
                    courseName: courseName,
                    courseId: courseId!,
                    courseStatus: courseStatus,
                  )));
                },
                child: Text(
                  "Quiz Selanjutnya",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: width / 1.4,
              height: width / 9,
              margin: const EdgeInsets.only(
                bottom: 16,
                left: 24,
                right: 24,
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  side: const BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      FadeAnimation2(page: const CourseTakenListScreen()));
                },
                child: Text(
                  "Kembali ke Kursus",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
