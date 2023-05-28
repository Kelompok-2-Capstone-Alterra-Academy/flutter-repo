import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/constant/mentor_list.dart';

import '../../../utils/color/color.dart';

class MentorScreen extends StatefulWidget {
  static const String routeName = "/mentor";
  const MentorScreen({super.key});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Mentor",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: mentorList.length,
          itemBuilder: (context, index) => Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 2,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onTap: () {},
              child: Column(
                children: [
                  const SizedBox(height: 19),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      mentorList[index].pic!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    mentorList[index].name!,
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 116,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: subjectColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                        child: Text(
                      mentorList[index].subject!,
                      style: GoogleFonts.poppins(
                          fontSize: 11, fontWeight: FontWeight.w600),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
