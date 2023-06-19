import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/live_session/schedule_view_model.dart';
import '../../../models/schedule_model.dart';
import '../../../utils/animation/fade_animation2.dart';
import '../../../utils/constant/list_schedule_course.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../widgets/card_button.dart';
import 'detail_schadule_screen.dart';

class ScheduleCourseScreen extends StatefulWidget {
  static const routeName = '/schedule';

  const ScheduleCourseScreen({Key? key}) : super(key: key);

  @override
  _ScheduleCourseScreenState createState() => _ScheduleCourseScreenState();
}

class _ScheduleCourseScreenState extends State<ScheduleCourseScreen> {
  String selectedFilter = 'Semua';
  List<ScheduleCourseModel> filteredList = scheduleList;
  late PreferencesUtils preferencesUtils;

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;

      if (filter == 'Semua') {
        filteredList = scheduleList;
      } else {
        filteredList = scheduleList
            .where((schedule) => schedule.status == filter)
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<ScheduleViewModel>(context, listen: false);
      provider.getAllSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          "Jadwal Pertemuan Kelas",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<ScheduleViewModel>(
        builder: (context, value, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScheduleFilterButton(
                      text: 'Semua',
                      onPressed: () => applyFilter('Semua'),
                      isSelected: selectedFilter == 'Semua',
                    ),
                    ScheduleFilterButton(
                      text: 'Sudah Ikut',
                      onPressed: () => applyFilter('Sudah Ikut'),
                      isSelected: selectedFilter == 'Sudah Ikut',
                    ),
                    ScheduleFilterButton(
                      text: 'Belum Ikut',
                      onPressed: () => applyFilter('Belum Ikut'),
                      isSelected: selectedFilter == 'Belum Ikut',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: ListView.builder(
                    itemCount: value.scheduleList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeAnimation2(
                              page: DetailScheduleScreen(
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            title: Text(
                              value.scheduleList[index].date,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.scheduleList[index].course,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: value.scheduleList[index].status ==
                                        'Sudah Ikut'
                                    ? Colors.green
                                    : Colors.orange,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                value.scheduleList[index].status,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
