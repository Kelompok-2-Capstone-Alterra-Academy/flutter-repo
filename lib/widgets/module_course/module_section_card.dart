import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/ppt_model.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_video_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_ppt_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_task_screen.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';

import '../../utils/animation/fade_animation2.dart';
import '../../utils/color/color.dart';

class ModuleSectionCard extends StatelessWidget {
  const ModuleSectionCard({
    super.key,
    this.id,
    this.sectionId,
    this.sectionName,
    this.courseName,
    this.numbering,
    this.isVideoAvailable,
    this.isMaterialAvailable,
    this.isAssignmentAvailable,
    this.dueDate,
    this.isSectionFinished,
    this.linkModule,
    this.moduleDescription,
  });

  final int? id;
  final int? sectionId;
  final String? sectionName;
  final String? courseName;
  final int? numbering;
  final bool? isVideoAvailable;
  final bool? isMaterialAvailable;
  final bool? isAssignmentAvailable;
  final String? dueDate;
  final bool? isSectionFinished;
  final String? linkModule;
  final String? moduleDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "Section $id - $sectionName",
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            color: const Color(0xff616161),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
