import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/module_list.dart';
// import 'package:staredu/utils/constant/module_list.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';
import 'package:staredu/widgets/course/course_certificate.dart';
import 'package:staredu/widgets/module_course/module_button.dart';
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
    Provider.of<ModuleListViewModel>(context, listen: false).getModuleList();
  }

  @override
  Widget build(BuildContext context) {
    final moduleViewModel = Provider.of<ModuleListViewModel>(context);
    final List filteredModuleList = moduleViewModel.moduleList
        .where((moduleList) => moduleList.courseId == widget.courseId)
        .toList();
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            itemCount: filteredModuleList.length,
                            itemBuilder: (context, index) {
                              return ModuleSectionCard(
                                id: filteredModuleList[index].id,
                                sectionId: filteredModuleList[index].id,
                                sectionName: filteredModuleList[index].title,
                                courseName: widget.courseName.toString(),
                                isVideoAvailable:
                                    filteredModuleList[index].video,
                                isMaterialAvailable:
                                    filteredModuleList[index].material,
                                isAssignmentAvailable:
                                    filteredModuleList[index].assignment,
                                isSectionFinished:
                                    filteredModuleList[index].finished,
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
                  const CourseCertificate()
                ],
              );
            },
          ),
          bottomNavigationBar: const BottomNavigationBarComponent()),
    );
  }
}
