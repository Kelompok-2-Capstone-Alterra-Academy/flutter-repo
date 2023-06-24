// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';

import '../../utils/animation/fade_animation2.dart';

class ReviewDialog extends StatefulWidget {
  final int courseId;
  const ReviewDialog({
    super.key,
    required this.courseId,
  });

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
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
                width: 180,
                image:
                    AssetImage('assets/images/finish_course_dialog_image.jpg'),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Kerja Bagus!",
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
                    "Kamu telah menyelesaikan kursus, seberapa kamu puas dengan kursusnya?",
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
              RatingBar.builder(
                initialRating: 0,
                glowColor: starReviewColor,
                direction: Axis.horizontal,
                glowRadius: 1,
                allowHalfRating: true,
                unratedColor: searchBarColor,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, _) => const Image(
                  image: AssetImage('assets/images/star_rating.png'),
                  color: starReviewColor,
                ),
                onRatingUpdate: (value) {
                  Provider.of<CourseTakenViewModel>(context, listen: false)
                      .setRating(value);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              AnimatedContainer(
                height:
                    Provider.of<CourseTakenViewModel>(context).isRatingInputted
                        ? 146
                        : 0, // Set the desired height
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 146,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Visibility(
                    visible: Provider.of<CourseTakenViewModel>(context)
                        .isRatingInputted,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Berikan ulasan anda untuk kursus ini",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: _notesController,
                            decoration: InputDecoration(
                              hintText: "Tulis Ulasan..",
                              hintStyle: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: searchBarTextColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: blackColor,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: width,
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
                      onPressed: () async {
                        //get token
                        PreferencesUtils preferencesUtils = PreferencesUtils();
                        await preferencesUtils.init();

                        String token =
                            preferencesUtils.getPreferencesString('token') ??
                                "";

                        //send rating

                        String msg = await Provider.of<CourseTakenViewModel>(
                                context,
                                listen: false)
                            .sendReview(
                          token,
                          widget.courseId,
                          context.read<CourseTakenViewModel>().rating.toInt(),
                          _notesController.text,
                        );

                        Provider.of<CourseTakenViewModel>(context,
                                listen: false)
                            .clearRating();
                        if (msg.contains('success')) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Ulasanmu sudah kami rekam",
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              backgroundColor: successColor,
                            ),
                          );
                          Navigator.pop(context);
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animations, secondaryAnimations) =>
                                      const CourseTakenListScreen(),
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
                        } else {
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Gagal mengirim ulasan",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                            backgroundColor: redWarningColor,
                          );
                        }
                      },
                      child: Text(
                        "Kirim Ulasan",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
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
                        Provider.of<CourseTakenViewModel>(context,
                                listen: false)
                            .clearRating();
                        Navigator.of(context).push(
                          FadeAnimation2(page: const CourseTakenListScreen()),
                        );
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
