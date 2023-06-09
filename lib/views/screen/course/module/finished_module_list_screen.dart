import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/new_module_list_model.dart';
import 'package:staredu/utils/animation/fade_animation2.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/view_model/course/certificate_view_model.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';
import 'package:staredu/widgets/course/course_certificate.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';
import 'package:staredu/widgets/module_course/module_button.dart';
import 'package:staredu/widgets/module_course/module_card.dart';
import 'package:staredu/widgets/module_course/module_section_card.dart';

import '../../../../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class FinishedModuleListScreen extends StatefulWidget
    with WidgetsBindingObserver {
  static const String routeName = "/finishedmodulelist";

  final String? courseName;
  final int? courseId;
  final bool? isLastModule;
  final bool? courseFinished;
  final String? courseScore;

  const FinishedModuleListScreen({
    super.key,
    this.courseName,
    this.courseId,
    this.isLastModule,
    this.courseFinished,
    this.courseScore,
  });

  @override
  State<FinishedModuleListScreen> createState() =>
      _FinishedModuleListScreenState();
}

class _FinishedModuleListScreenState extends State<FinishedModuleListScreen> {
  @override
  void initState() {
    super.initState();
    getCourseModule();

    Provider.of<CertificateViewModel>(context, listen: false).getCertificate();
  }

  void getCourseModule() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    String token = preferencesUtils.getPreferencesString('token') ?? "";

    if (context.mounted) {
      await Provider.of<ModuleListViewModel>(context, listen: false)
          .getCourseModule(token, widget.courseId);
      if (context.mounted) {
        final totalSection =
            context.read<ModuleListViewModel>().courseModule.length;
        int totalModule = 0;
        for (var m = 0; m < totalSection; m++) {
          totalModule += context
                  .read<ModuleListViewModel>()
                  .courseModule[m]
                  .module
                  ?.length ??
              0;
        }

        //get current user
        String email =
            preferencesUtils.getPreferencesString("user_email") ?? "";

        preferencesUtils.savePreferencesInt(
          'total_section_course_${widget.courseId}_$email',
          totalModule,
        );
      }
    }
  }

  int courseTaskAmount() {
    final List<NewModuleListModel> countCourseTask = [];

    final moduleViewModel =
        Provider.of<ModuleListViewModel>(context, listen: false);

    for (var i in moduleViewModel.courseModule) {
      for (var j in i.module!) {
        if (j.attachment!.type!.contains('document')) {
          countCourseTask.add(i);
        }
      }
    }

    final int courseTaskAmount = countCourseTask.length;

    return courseTaskAmount;
  }

  int courseVideoAmount() {
    final List<NewModuleListModel> countCourseVideo = [];

    final moduleViewModel =
        Provider.of<ModuleListViewModel>(context, listen: false);

    for (var i in moduleViewModel.courseModule) {
      for (var j in i.module!) {
        if (j.attachment!.type!.contains('video')) {
          countCourseVideo.add(i);
        }
      }
    }

    final int courseVideoAmount = countCourseVideo.length;
    return courseVideoAmount;
  }

  int courseMaterialAmount() {
    final List<NewModuleListModel> countCourseMaterial = [];

    final moduleViewModel =
        Provider.of<ModuleListViewModel>(context, listen: false);

    for (var i in moduleViewModel.courseModule) {
      for (var j in i.module!) {
        if (j.attachment!.type!.contains('ppt')) {
          countCourseMaterial.add(i);
        }
      }
    }

    final int courseMaterialAmount = countCourseMaterial.length;
    return courseMaterialAmount;
  }

  @override
  Widget build(BuildContext context) {
    final moduleViewModel =
        Provider.of<ModuleListViewModel>(context, listen: false);
    final certificateViewModel =
        Provider.of<CertificateViewModel>(context, listen: false);
    final double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: whiteColor,
            foregroundColor: blackColor,
            elevation: 0,
            title: Text(
              widget.courseName.toString(),
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    FadeAnimation2(page: const CourseTakenListScreen()),
                    (route) => false);
              },
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  labelColor: primaryColor,
                  unselectedLabelColor: blackColor,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      child: Text(
                        "Modul",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Sertifikat",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Consumer<ModuleListViewModel>(
            builder: (context, value, child) {
              return TabBarView(
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          color: whiteColor,
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 24,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ModuleButton(
                                    courseId: widget.courseId ?? 0,
                                    courseName: widget.courseName.toString(),
                                    width: screenWidth,
                                    text: "Live Session",
                                    borderColor: primaryColor,
                                    courseStatus: widget.courseFinished!,
                                  ),
                                  ModuleButton(
                                    courseId: widget.courseId ?? 0,
                                    courseName: widget.courseName.toString(),
                                    width: screenWidth,
                                    text: "Quiz",
                                    borderColor: primaryColor,
                                    courseStatus: widget.courseFinished!,
                                  ),
                                  ModuleButton(
                                    courseId: widget.courseId ?? 0,
                                    courseName: widget.courseName.toString(),
                                    width: screenWidth,
                                    text: "Tanya Mentor",
                                    borderColor: primaryColor,
                                    courseStatus: widget.courseFinished!,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: moduleViewModel.courseModule.length,
                                itemBuilder: (context, firstIndex) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ModuleSectionCard(
                                        id: firstIndex + 1,
                                        sectionName: moduleViewModel
                                            .courseModule[firstIndex]
                                            .sectionName,
                                      ),
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: moduleViewModel
                                            .courseModule[firstIndex]
                                            .module!
                                            .length,
                                        itemBuilder: (context, secondIndex) {
                                          if (widget.isLastModule ?? false) {
                                            return ModuleCard(
                                              isLastModule: true,
                                              id: widget.courseId,
                                              sectionId: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .sectionId,
                                              sectionName: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .sectionName,
                                              courseName:
                                                  widget.courseName.toString(),
                                              moduleName: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .attachment!
                                                  .attachmentName
                                                  .toString(),
                                              numbering: secondIndex + 1,
                                              isVideoAvailable: moduleViewModel
                                                      .courseModule[firstIndex]
                                                      .module![secondIndex]
                                                      .attachment!
                                                      .type!
                                                      .contains('video')
                                                  ? true
                                                  : false,
                                              isMaterialAvailable:
                                                  moduleViewModel
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .attachment!
                                                          .type!
                                                          .contains('ppt')
                                                      ? true
                                                      : false,
                                              isAssignmentAvailable:
                                                  moduleViewModel
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .attachment!
                                                          .type!
                                                          .contains('document')
                                                      ? true
                                                      : false,
                                              dueDate:
                                                  DateTime.now().toString(),
                                              isSectionFinished: true,
                                              linkModule: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .attachment!
                                                  .attachmentSource,
                                              moduleDescription: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .attachment!
                                                  .description
                                                  .toString(),
                                              moduleId: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .id,
                                            );
                                          } else {
                                            return ModuleCard(
                                              isLastModule: false,
                                              id: widget.courseId,
                                              sectionId: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .sectionId,
                                              sectionName: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .sectionName,
                                              courseName:
                                                  widget.courseName.toString(),
                                              moduleName: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .attachment!
                                                  .attachmentName
                                                  .toString(),
                                              numbering: secondIndex + 1,
                                              isVideoAvailable: moduleViewModel
                                                      .courseModule[firstIndex]
                                                      .module![secondIndex]
                                                      .attachment!
                                                      .type!
                                                      .contains('video')
                                                  ? true
                                                  : false,
                                              isMaterialAvailable:
                                                  moduleViewModel
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .attachment!
                                                          .type!
                                                          .contains('ppt')
                                                      ? true
                                                      : false,
                                              isAssignmentAvailable:
                                                  moduleViewModel
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .attachment!
                                                          .type!
                                                          .contains('document')
                                                      ? true
                                                      : false,
                                              dueDate:
                                                  DateTime.now().toString(),
                                              isSectionFinished: true,
                                              linkModule: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .attachment!
                                                  .attachmentSource,
                                              moduleDescription: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .attachment!
                                                  .description
                                                  .toString(),
                                              moduleId: moduleViewModel
                                                  .courseModule[firstIndex]
                                                  .module![secondIndex]
                                                  .id,
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 2,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Consumer<ModuleListViewModel>(
                        builder: (context, value, child) =>
                            value.myState == MyState.loading
                                ? const OpacityProgressComponent()
                                : const SizedBox.shrink(),
                      ),
                      Consumer<ModuleListViewModel>(
                        builder: (context, value, child) =>
                            value.myState == MyState.loading
                                ? const CircularProgressComponent()
                                : const SizedBox.shrink(),
                      )
                    ],
                  ),
                  widget.courseFinished!
                      ? Consumer<CertificateViewModel>(
                          builder: (context, value, child) {
                            return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return CourseCertificate(
                                  pdfLink: certificateViewModel
                                      .moduleCertificate[index].link,
                                  courseScore: widget.courseScore,
                                  courseTaskAmount:
                                      courseTaskAmount().toString(),
                                  courseVideoAmount:
                                      courseVideoAmount().toString(),
                                  courseMaterialAmount:
                                      courseMaterialAmount().toString(),
                                );
                              },
                            );
                          },
                        )
                      : const Center(
                          child: Text("Kursus Belum Selesai !"),
                        ),
                ],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBarComponent(
            indexDefined: 1,
          )),
    );
  }
}
