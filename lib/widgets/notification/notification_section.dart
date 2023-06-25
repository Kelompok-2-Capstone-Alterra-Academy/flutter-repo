import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class NotificationSection extends StatelessWidget {
  final int id;
  final String title;
  final String course;
  final String description;
  final String date;
  final String time;
  const NotificationSection(
      {Key? key,
      required this.id,
      required this.title,
      required this.course,
      required this.description,
      required this.date,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // border on bottom
      decoration: BoxDecoration(
        color: id % 2 != 0 ? whiteColor : greyColor,
        border: const Border(
          bottom: BorderSide(width: 0.5),
        ),
      ),
      child: Column(
        // text align start
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: blackColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            course,
            style: GoogleFonts.poppins(
              color: greyColor2,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: GoogleFonts.poppins(
              color: blackColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                date,
                style: GoogleFonts.poppins(
                  color: greyColor2,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                time,
                style: GoogleFonts.poppins(
                  color: greyColor2,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
