import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/quiz_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/course/module/detail/module_quiz_detail_screen.dart';

import '../../utils/animation/fade_animation2.dart';

class ModuleQuizCard extends StatelessWidget {
  const ModuleQuizCard({
    super.key,
    this.id,
    this.title,
    this.isQuizAvailable,
    this.numbering,
  });

  final int? id;
  final String? title;
  final bool? isQuizAvailable;
  final String? numbering;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        isQuizAvailable!
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animations, secondaryAnimations) =>
                          ModuleQuizDetailScreen(
                        quizDetail: QuizDetailModel(),
                      ),
                      transitionsBuilder:
                          (context, animations, secondaryAnimations, childs) {
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
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lightBlueColor,
                    ),
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    height: 59,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Quiz ${numbering.toString()} - $title",
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "100 Point",
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
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
          height: 10,
        ),
      ],
    );
  }
}
