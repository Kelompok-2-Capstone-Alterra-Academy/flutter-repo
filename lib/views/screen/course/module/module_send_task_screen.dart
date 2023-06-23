// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/view_model/course/task_view_model.dart';
import 'package:staredu/widgets/course/review_dialog.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';
import 'package:staredu/widgets/module_course/module_send_task_done_dialog.dart';

class ModuleSendTaskScreen extends StatefulWidget {
  static const String routeName = "/sendtask";
  final bool isLastIndex;
  final int courseId;
  final int moduleId;
  final bool? isFinished;
  final String? courseName;
  final String? sectionName;
  final String? description;
  final String? dueDate;

  const ModuleSendTaskScreen({
    super.key,
    required this.isLastIndex,
    required this.courseId,
    required this.moduleId,
    this.isFinished,
    this.courseName,
    this.sectionName,
    this.description,
    this.dueDate,
  });

  @override
  State<ModuleSendTaskScreen> createState() => _ModuleSendTaskScreenState();
}

class _ModuleSendTaskScreenState extends State<ModuleSendTaskScreen> {
  final TextEditingController _notesController = TextEditingController();

  Future<void> saveSectionProgress() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    //get current user
    String email = preferencesUtils.getPreferencesString("user_email") ?? "";
    //get current section
    int currentSection = preferencesUtils.getPreferencesInt(
            'current_section_course_${widget.courseId}_$email') ??
        0;
    //increment the current section value
    await preferencesUtils.savePreferencesInt(
      'current_section_course_${widget.courseId}_$email',
      currentSection + 1,
    );
  }

  Future<void> updateModuleStatus() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    await preferencesUtils.init();

    await preferencesUtils.savePreferencesBool(
        "${widget.moduleId.toString()}_$email", true);
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        title: Text(
          "Latihan - ${widget.sectionName}",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                color: whiteColor,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        widget.courseName.toString(),
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.description.toString(),
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Waktu: ",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Tanggal : ${formatDate(widget.dueDate ?? DateTime.now().toString())}",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "Tipe : Soal Essay",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Lampiran",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: outlinedButtonColor,
                                side: const BorderSide(
                                    color: outlinedButtonColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                    'doc',
                                    'docx',
                                  ],
                                );

                                if (result != null) {
                                  Provider.of<TaskViewModel>(context,
                                          listen: false)
                                      .setAssignmentFile(
                                    name: result.files.single.name,
                                    path: result.files.single.path!,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Gagal mengupload file !"),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Pilih File",
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Consumer<TaskViewModel>(
                              builder: (context, value, child) {
                                return Text(
                                  value.fileName,
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Tambahkan catatan",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        maxLines: 4,
                        controller: _notesController,
                        decoration: InputDecoration(
                          hintText: "Tulis catatan..",
                          hintStyle: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: searchBarTextColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: constraints.maxWidth,
                        height: 40,
                        child: widget.isFinished!
                            ? OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: searchBarTextColor,
                                  backgroundColor: searchBarColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: null,
                                child: Text(
                                  "Selesai",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            : OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: whiteColor,
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () async {
                                  PreferencesUtils preferencesUtils =
                                      PreferencesUtils();
                                  await preferencesUtils.init();

                                  String token = preferencesUtils
                                          .getPreferencesString('token') ??
                                      "";

                                  String msg = await Provider.of<TaskViewModel>(
                                          context,
                                          listen: false)
                                      .sendTask(
                                    token: token,
                                    moduleId: widget.moduleId.toString(),
                                    filePath: Provider.of<TaskViewModel>(
                                            context,
                                            listen: false)
                                        .filePath,
                                    notes: _notesController.text,
                                  );
                                  if (msg.contains('success')) {
                                    if (widget.isLastIndex) {
                                      await saveSectionProgress();
                                      await updateModuleStatus();
                                      if (context.mounted) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => ReviewDialog(
                                            courseId: widget.courseId,
                                          ),
                                        );
                                      }
                                    } else {
                                      await saveSectionProgress();
                                      await updateModuleStatus();
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const ModuleSendTaskDoneDialog(),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(msg),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<TaskViewModel>(
                builder: (context, value, child) =>
                    value.state == MyState.loading
                        ? const OpacityProgressComponent()
                        : const SizedBox.shrink(),
              ),
              Consumer<TaskViewModel>(
                builder: (context, value, child) =>
                    value.state == MyState.loading
                        ? const CircularProgressComponent()
                        : const SizedBox.shrink(),
              )
            ],
          );
        },
      ),
    );
  }
}
