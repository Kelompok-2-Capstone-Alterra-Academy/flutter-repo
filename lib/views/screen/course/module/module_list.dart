import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/module_section_list.dart';
import 'package:staredu/views/screen/course/course_taken_list.dart';
import 'package:staredu/widgets/module_course/module_button.dart';
import 'package:staredu/widgets/module_course/module_section_card.dart';

class ModuleListScreen extends StatefulWidget {
  static const String routeName = "/modulelist";

  const ModuleListScreen({super.key});

  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final args =
        ModalRoute.of(context)!.settings.arguments as ModuleCourseArguments;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: whiteColor,
            foregroundColor: blackColor,
            elevation: 0,
            title: Text(
              args.title,
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
          body: TabBarView(
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
                            courseName: args.title,
                            width: screenWidth,
                            text: "Live Session",
                            borderColor: primaryColor,
                          ),
                          ModuleButton(
                            courseName: args.title,
                            width: screenWidth,
                            text: "Quiz",
                            borderColor: primaryColor,
                          ),
                          ModuleButton(
                            courseName: args.title,
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
                        itemCount: moduleSection.length,
                        itemBuilder: (context, index) {
                          return ModuleSectionCard(
                            id: moduleSection[index].id,
                            title: moduleSection[index].title,
                            courseName: args.title,
                            isVideoAvailable: moduleSection[index].video,
                            isMaterialAvailable: moduleSection[index].material,
                            isAssignmentAvailable:
                                moduleSection[index].assignment,
                            isSectionFinished: moduleSection[index].finished,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 2,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Icon(Icons.account_circle),
              ),
            ],
          ),
        ));
  }
}

class ModuleListQuizArguments {
  final String courseName;

  ModuleListQuizArguments(this.courseName);
}
