import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/list_course_taken.dart';
import 'package:staredu/utils/constant/module_section_list.dart';
import 'package:staredu/widgets/module_course/module_task_card.dart';

class TaskListScreen extends StatefulWidget {
  static const String routeName = "/tasklist";
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        title: Text(
          "Tugas",
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
              const SizedBox(
                height: 12,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, indexCourse) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: moduleSection.length,
                      itemBuilder: (context, indexSection) {
                        String? courseName = courseTaken[indexCourse].title;
                        return ModuleTaskCard(
                          courseName: courseName,
                          sectionName: moduleSection[indexSection].title,
                          sectionNumbering: indexSection.toInt(),
                          isAssignmentAvailable:
                              moduleSection[indexSection].assignment,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 2,
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 2,
                    );
                  },
                  itemCount: courseTaken.length)
              // ListView.separated(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              // itemCount: moduleSection.length,
              // itemBuilder: (context, index) {
              //   return ModuleQuizCard(
              //     id: moduleSection[index].id!.toInt(),
              //     isQuizAvailable: moduleSection[index].quiz,
              //     title: moduleSection[index].title!.toString(),
              //     numbering: index.toString(),
              //   );
              // },
              // separatorBuilder: (BuildContext context, int index) {
              //   return const SizedBox(
              //     height: 2,
              //   );
              // },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
