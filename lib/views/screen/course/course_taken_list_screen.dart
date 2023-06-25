import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/view_model/course/course_taken_view_model.dart';
import 'package:staredu/widgets/course/finished_course_taken_list.dart';
import 'package:staredu/widgets/course/ongoing_course_taken_list.dart';

import '../../../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class CourseTakenListScreen extends StatefulWidget {
  static const String routeName = "/coursetaken";
  const CourseTakenListScreen({super.key});

  @override
  State<CourseTakenListScreen> createState() => _CourseTakenListScreenState();
}

class _CourseTakenListScreenState extends State<CourseTakenListScreen> {
  @override
  void initState() {
    super.initState();
    getCourse();
  }

  void getCourse() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();

    String token = preferencesUtils.getPreferencesString('token') ?? "";

    if (context.mounted) {
      Provider.of<CourseTakenViewModel>(context, listen: false)
          .getCourseTaken(token);
    }
  }

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
          body: Consumer<CourseTakenViewModel>(
            builder: (context, value, child) {
              return TabBarView(
                children: [
                  OnGoingCourseTakenListScreen(
                    viewModel: value,
                  ),
                  FinishedCourseTakenListScreen(
                    viewModel: value,
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
