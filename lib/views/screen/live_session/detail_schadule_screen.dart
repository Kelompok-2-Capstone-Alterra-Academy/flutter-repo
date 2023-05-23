import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/schedule_model.dart';

class DetailScheduleScreen extends StatefulWidget {
  static const routeName = '/detailschedule';

  final ScheduleCourseModel schedule; // Added schedule parameter

  const DetailScheduleScreen({Key? key, required this.schedule})
      : super(key: key);

  @override
  _DetailScheduleScreenState createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    final schedule = widget.schedule;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 100),
                Text(
                  "Live Session",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/live_session.png',
                width: 275,
                height: 175,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              schedule.course,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Membahas seputar Matematika Dasar kelas 11 IPS dan sesi tanya jawab Matematika Dasar ",
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Waktu:",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              '${schedule.date}\nLama Live Session 3 jam ',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 130,
                  ),
                ),
                child: Text(
                  'Join Meeting',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
