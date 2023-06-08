import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/module_list.dart';
import 'package:staredu/widgets/module_course/module_quiz_card.dart';

class ModuleListQuizScreen extends StatefulWidget {
  static const String routeName = "/modulelistquiz";

  final String? courseName;
  const ModuleListQuizScreen({super.key, this.courseName});

  @override
  State<ModuleListQuizScreen> createState() => _ModuleListQuizScreenState();
}

class _ModuleListQuizScreenState extends State<ModuleListQuizScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        title: Text(
          "Quiz",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          color: whiteColor,
          alignment: AlignmentDirectional.topStart,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 18,
            bottom: 28,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  widget.courseName.toString(),
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: moduleList.length,
                itemBuilder: (context, index) {
                  return ModuleQuizCard(
                    id: moduleList[index].id!.toInt(),
                    isQuizAvailable: moduleList[index].quiz,
                    title: moduleList[index].title!.toString(),
                    numbering: index.toString(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 2,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
