import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import '../../../models/schedule_model.dart';
import '../../../views/screen/live_session/schedule_view_model.dart';

class DetailScheduleScreen extends StatefulWidget {
  static const routeName = '/detailschedule';

  final ScheduleCourseModel schedule;

  const DetailScheduleScreen({Key? key, required this.schedule})
      : super(key: key);

  @override
  _DetailScheduleScreenState createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          "Live Session",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ScheduleViewModel>(
          builder: (context, value, _) {
            return ListView.builder(
                itemCount: value.scheduleList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
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
                        value.scheduleList[index].course,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Membahas seputar Matematika Dasar kelas 11 IPS dan sesi tanya jawab Matematika Dasar ",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Waktu:",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${value.scheduleList[index].date}\nLama Live Session 3 jam ',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
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
                  );
                });
          },
        ),
      ),
    );
  }
}
