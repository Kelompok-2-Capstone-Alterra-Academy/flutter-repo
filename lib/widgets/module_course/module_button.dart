import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/arguments/module_list_quiz_argument.dart';
import 'package:staredu/views/screen/course/module/module_ask_mentor_screen.dart';
// import 'package:staredu/views/screen/course/module/module_live_session.dart';
import 'package:staredu/views/screen/course/module/module_list_quiz_screen.dart';
import 'package:staredu/views/screen/course/module/module_task_list_screen.dart';

import '../../utils/color/color.dart';

class ModuleButton extends StatelessWidget {
  const ModuleButton({
    super.key,
    required this.courseName,
    required this.width,
    required this.text,
    required this.borderColor,
  });

  final String courseName;
  final double width;
  final String text;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (text == "Live Session") {
              // Navigator.pushNamed(context, LiveSessionScreen.routeName);
              Navigator.pushNamed(context, TaskListScreen.routeName);
            }

            if (text == "Quiz") {
              Navigator.pushNamed(context, ModuleListQuizScreen.routeName,
                  arguments: ModuleListQuizArguments(courseName.toString()));
            }

            if (text == "Tanya Mentor") {
              Navigator.pushNamed(context, AskMentorScreen.routeName);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
