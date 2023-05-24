import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/widgets/course/finished_course_taken_list.dart';
import 'package:staredu/widgets/course/ongoing_course_taken_list.dart';

class CourseTakenListScreen extends StatefulWidget {
  static const String routeName = "/coursetaken";
  const CourseTakenListScreen({super.key});

  @override
  State<CourseTakenListScreen> createState() => _CourseTakenListScreenState();
}

class _CourseTakenListScreenState extends State<CourseTakenListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          foregroundColor: blackColor,
          elevation: 0,
          title: Text(
            "Kursus Saya",
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
                      "Berlangsung",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Selesai",
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
        body: const TabBarView(
          children: [
            OnGoingCourseTakenListScreen(),
            FinishedCourseTakenListScreen(),
          ],
        ),
      ),
    );
  }
}

class ModuleCourseArguments {
  final String title;
  final int currentSection;
  final int totalSection;

  ModuleCourseArguments(this.title, this.currentSection, this.totalSection);
}
