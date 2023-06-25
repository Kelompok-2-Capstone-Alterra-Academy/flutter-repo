// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/live_session/schedule_web_view.dart';
import '../../../views/screen/live_session/schedule_view_model.dart';

class DetailScheduleScreen extends StatefulWidget {
  static const routeName = '/detailschedule';

  final int index;
  const DetailScheduleScreen({Key? key, required this.index}) : super(key: key);

  @override
  _DetailScheduleScreenState createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen> {
  bool isAttended = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<ScheduleViewModel>(context, listen: false);
      provider.getAllSchedule();
      isAttended = provider.scheduleList[widget.index].status == 'Sudah Ikut';
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
                  value.scheduleList[widget.index].course,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Membahas seputar Materi dan sesi tanya jawab mengenai Materi yang di bahas. ",
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
                  '${value.scheduleList[widget.index].date}\nLama Live Session 3 jam ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: isAttended
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScheduleWebView(
                                  url: value.scheduleList[widget.index].url,
                                ),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 130,
                      ),
                      backgroundColor: isAttended ? searchBarColor : null,
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
          },
        ),
      ),
    );
  }
}
