import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/quiz_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/widgets/course/review_dialog.dart';
import 'package:staredu/widgets/module_course/module_quiz_detail_done_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ModuleQuizDetailScreen extends StatefulWidget {
  static const String routeName = "/quizdetail";
  final QuizDetailModel quizDetail;
  final bool isLastIndex;
  final int courseId;
  final int moduleId;
  const ModuleQuizDetailScreen({
    super.key,
    required this.quizDetail,
    required this.isLastIndex,
    required this.courseId,
    required this.moduleId,
  });

  @override
  State<ModuleQuizDetailScreen> createState() => _ModuleQuizDetailScreenState();
}

class _ModuleQuizDetailScreenState extends State<ModuleQuizDetailScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          widget.quizDetail.url ??
              'https://docs.google.com/forms/d/e/1FAIpQLSdzKOirkmbwCFED1bTIfY2mJqu6UfGdA4y9CI-3kud-UUBRsg/viewform?usp=sf_link',
        ),
      );
  }

  Future<void> saveSectionProgress() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    //get current user
    String email = preferencesUtils.getPreferencesString("user_email") ?? "";
    //get current section
    int currentSection = preferencesUtils.getPreferencesInt(
            'current_section_course_${widget.courseId}_$email') ??
        0;
    //increment the current section value
    await preferencesUtils.savePreferencesInt(
      'current_section_course_${widget.courseId}_$email',
      currentSection + 1,
    );
  }

  Future<void> updateModuleStatus() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    await preferencesUtils.init();

    await preferencesUtils.savePreferencesBool(
        "${widget.moduleId.toString()}_$email", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        title: Text(
          widget.quizDetail.section ?? "Quiz Section 1",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.quizDetail.lesson ??
                        "Matematika Dasar - Fungsi Trigonometri",
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Kerjakan Soal Pilihan Ganda di bawah ini untuk mendapatkan nilai tambahan!",
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: constraints.maxHeight * 0.73,
                  width: constraints.maxWidth,
                  color: primaryColor,
                  child: WebViewWidget(controller: controller),
                ),
                const Spacer(),
                Container(
                  width: constraints.maxWidth,
                  margin: const EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
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
                      if (widget.isLastIndex) {
                        saveSectionProgress();
                        updateModuleStatus();
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => ReviewDialog(
                              courseId: widget.courseId,
                            ),
                          );
                        }
                      } else {
                        saveSectionProgress();
                        updateModuleStatus();
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                const ModuleQuizDetailDoneDialog(),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Selesai",
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
          );
        },
      ),
    );
  }
}
