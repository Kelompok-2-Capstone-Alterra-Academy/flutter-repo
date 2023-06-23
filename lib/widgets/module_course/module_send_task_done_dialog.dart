import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/screen/home/home_screen.dart';

import '../../utils/animation/fade_animation2.dart';

class ModuleSendTaskDoneDialog extends StatelessWidget {
  const ModuleSendTaskDoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Container(
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
              height: 50,
            ),
            const Image(
              image: AssetImage('assets/images/send_task_done.png'),
              width: 234,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Sukses Upload Tugas",
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
                  "Selamat tugas kamu sudah berhasil terkirim",
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
              height: 20,
            ),
            Container(
              width: width / 1.4,
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
                  Navigator.of(context).pushReplacement(
                      FadeAnimation2(page: const HomeScreen()));
                },
                child: Text(
                  "Kembali ke Home",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              width: width / 1.4,
              margin: const EdgeInsets.only(
                bottom: 16,
                left: 24,
                right: 24,
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: outlinedButtonColor,
                  side: const BorderSide(color: outlinedButtonColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      FadeAnimation2(page: const CourseTakenListScreen()));
                },
                child: Text(
                  "Kursus Saya",
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
