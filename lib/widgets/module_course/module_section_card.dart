import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
