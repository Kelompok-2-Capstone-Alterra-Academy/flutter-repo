import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/schedule_model.dart';
import '../../utils/animation/fade_animation2.dart';
import '../../utils/color/color.dart';
import '../../utils/constant/list_schedule_course.dart';
import '../../views/screen/live_session/detail_schadule_screen.dart';

class CardLiveSession extends StatelessWidget {
  const CardLiveSession({
    super.key,
    required this.schedule,
    required this.index,
  });

  final ScheduleCourseModel schedule;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            FadeAnimation2(
                page: DetailScheduleScreen(schedule: scheduleList[index])));
      },
      child: Container(
        // Styling Container
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          // Judul ListTile
          title: Text(
            schedule.date,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          // Subjudul ListTile
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                schedule.course,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          // Widget trailing ListTile
          trailing: Container(
            // Styling container trailing
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: schedule.status == 'Sudah Ikut'
                  ? Colors.green
                  : Colors.orange,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              schedule.status,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
