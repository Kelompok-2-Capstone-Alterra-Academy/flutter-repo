import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/new_module_list_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/view_model/course/certificate_view_model.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';
import 'package:staredu/widgets/course/course_certificate.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';
import 'package:staredu/widgets/module_course/module_button.dart';
import 'package:staredu/widgets/module_course/module_card.dart';
import 'package:staredu/widgets/module_course/module_section_card.dart';

import '../../../../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class ModuleListScreen extends StatefulWidget with WidgetsBindingObserver {
  static const String routeName = "/modulelist";

  final String? courseName;
  final int? courseId;

  const ModuleListScreen({super.key, this.courseName, this.courseId});

  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
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
                                    courseName: widget.courseName.toString(),
                                    width: screenWidth,
                                    text: "Live Session",
                                    borderColor: primaryColor,
                                  ),
                                  ModuleButton(
                                    courseName: widget.courseName.toString(),
                                    width: screenWidth,
                                    text: "Quiz",
                                    borderColor: primaryColor,
                                  ),
                                  ModuleButton(
                                    courseName: widget.courseName.toString(),
                                    width: screenWidth,
                                    text: "Tanya Mentor",
                                    borderColor: primaryColor,
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
                                  //if its the last section by index
                                  if (firstIndex ==
                                      moduleViewModel.courseModule.length - 1) {
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
                                            //last index in last section
                                            if (secondIndex ==
                                                moduleViewModel
                                                        .courseModule[
                                                            firstIndex]
                                                        .module!
                                                        .length -
                                                    1) {
                                              return ModuleCard(
                                                isLastIndex: true,
                                                id: widget.courseId,
                                                sectionId: moduleViewModel
                                                    .courseModule[firstIndex]
                                                    .module![secondIndex]
                                                    .sectionId,
                                                sectionName: moduleViewModel
                                                    .courseModule[firstIndex]
                                                    .sectionName,
                                                courseName: widget.courseName
                                                    .toString(),
                                                moduleName: moduleViewModel
                                                    .courseModule[firstIndex]
                                                    .module![secondIndex]
                                                    .attachment!
                                                    .attachmentName
                                                    .toString(),
                                                numbering: secondIndex + 1,
                                                isVideoAvailable:
                                                    moduleViewModel
                                                                .courseModule[
                                                                    firstIndex]
                                                                .module![
                                                                    secondIndex]
                                                                .attachment!
                                                                .type ==
                                                            Type.VIDEO
                                                        ? true
                                                        : false,
                                                isMaterialAvailable: moduleViewModel
                                                                .courseModule[
                                                                    firstIndex]
                                                                .module![
                                                                    secondIndex]
                                                                .attachment!
                                                                .type ==
                                                            Type.DOCUMENT &&
                                                        moduleViewModel
                                                            .courseModule[
                                                                firstIndex]
                                                            .module![
                                                                secondIndex]
                                                            .tasks!
                                                            .isEmpty
                                                    ? true
                                                    : false,
                                                isAssignmentAvailable:
                                                    moduleViewModel
                                                            .courseModule[
                                                                firstIndex]
                                                            .module![
                                                                secondIndex]
                                                            .tasks!
                                                            .isEmpty
                                                        ? false
                                                        : true,
                                                dueDate:
                                                    DateTime.now().toString(),
                                                isSectionFinished: false,
                                                linkModule: moduleViewModel
                                                    .courseModule[firstIndex]
                                                    .module![secondIndex]
                                                    .attachment!
                                                    .attachmentSource,
                                                moduleDescription:
                                                    moduleViewModel
                                                        .courseModule[
                                                            firstIndex]
                                                        .module![secondIndex]
                                                        .attachment!
                                                        .description
                                                        .toString(),
                                              );
                                            }
                                            return ModuleCard(
                                              isLastIndex: false,
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
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .attachment!
                                                          .type ==
                                                      Type.VIDEO
                                                  ? true
                                                  : false,
                                              isMaterialAvailable: moduleViewModel
                                                              .courseModule[
                                                                  firstIndex]
                                                              .module![
                                                                  secondIndex]
                                                              .attachment!
                                                              .type ==
                                                          Type.DOCUMENT &&
                                                      moduleViewModel
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .tasks!
                                                          .isEmpty
                                                  ? true
                                                  : false,
                                              isAssignmentAvailable:
                                                  moduleViewModel
                                                          .courseModule[
                                                              firstIndex]
                                                          .module![secondIndex]
                                                          .tasks!
                                                          .isEmpty
                                                      ? false
                                                      : true,
                                              dueDate:
                                                  DateTime.now().toString(),
                                              isSectionFinished: false,
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
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                  //if not last section by index
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
                                          return ModuleCard(
                                            isLastIndex: false,
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
                                                        .courseModule[
                                                            firstIndex]
                                                        .module![secondIndex]
                                                        .attachment!
                                                        .type ==
                                                    Type.VIDEO
                                                ? true
                                                : false,
                                            isMaterialAvailable: moduleViewModel
                                                            .courseModule[
                                                                firstIndex]
                                                            .module![
                                                                secondIndex]
                                                            .attachment!
                                                            .type ==
                                                        Type.DOCUMENT &&
                                                    moduleViewModel
                                                        .courseModule[
                                                            firstIndex]
                                                        .module![secondIndex]
                                                        .tasks!
                                                        .isEmpty
                                                ? true
                                                : false,
                                            isAssignmentAvailable:
                                                moduleViewModel
                                                        .courseModule[
                                                            firstIndex]
                                                        .module![secondIndex]
                                                        .tasks!
                                                        .isEmpty
                                                    ? false
                                                    : true,
                                            dueDate: DateTime.now().toString(),
                                            isSectionFinished: false,
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
                                          );
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
                  Consumer<CertificateViewModel>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return CourseCertificate(
                            pdfLink: certificateViewModel
                                .moduleCertificate[index].link,
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBarComponent()),
    );
  }
}
