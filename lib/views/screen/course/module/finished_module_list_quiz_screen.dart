import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/new_module_list_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/module_list.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';
import 'package:staredu/widgets/module_course/module_quiz_card.dart';

class FinishedModuleListQuizScreen extends StatefulWidget {
  static const String routeName = "/finishedmodulelistquiz";

  final String? courseName;
  final int courseId;
  final bool? courseStatus;
  const FinishedModuleListQuizScreen({
    super.key,
    this.courseName,
    required this.courseId,
    this.courseStatus,
  });

  @override
  State<FinishedModuleListQuizScreen> createState() =>
      _FinishedModuleListQuizScreenState();
}

class _FinishedModuleListQuizScreenState
    extends State<FinishedModuleListQuizScreen> {
  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final moduleViewModel =
        Provider.of<ModuleListViewModel>(context, listen: false);
    final double screenWidth = MediaQuery.of(context).size.width;

    final isLastModule = checkIfLastModule(widget.courseId.toString());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        title: Text(
          "Quiz",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          color: whiteColor,
          alignment: AlignmentDirectional.topStart,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 18,
            bottom: 28,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  widget.courseName.toString(),
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Consumer<ModuleListViewModel>(
                builder: (context, value, child) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: moduleViewModel.courseQuiz.length,
                    itemBuilder: (context, firstIndex) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: moduleViewModel
                            .courseQuiz[firstIndex].module!.length,
                        itemBuilder: (context, secondIndex) {
                          return FutureBuilder(
                            future: isLastModule,
                            builder: (context, snapshotLastModule) {
                              return ModuleQuizCard(
                                isLastModule: snapshotLastModule.data ?? false,
                                id: int.parse(moduleViewModel
                                    .courseModule[firstIndex].courseId
                                    .toString()),
                                isQuizAvailable: moduleViewModel
                                        .courseQuiz[firstIndex]
                                        .module![secondIndex]
                                        .attachment!
                                        .type!
                                        .contains('quiz')
                                    ? true
                                    : false,
                                title: moduleViewModel
                                    .courseQuiz[firstIndex].sectionName,
                                numbering: (secondIndex + 1).toString(),
                                url: moduleViewModel
                                    .courseQuiz[firstIndex]
                                    .module![secondIndex]
                                    .attachment!
                                    .attachmentSource,
                                moduleId: moduleViewModel.courseQuiz[firstIndex]
                                    .module![secondIndex].id!
                                    .toInt(),
                                sectionFinished: widget.courseStatus,
                                courseName: widget.courseName,
                                courseStatus: widget.courseStatus,
                              );
                            },
                          );
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 2,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
