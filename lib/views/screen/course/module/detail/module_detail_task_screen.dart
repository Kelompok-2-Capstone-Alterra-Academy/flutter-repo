import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/http/http_utils.dart';
import 'package:staredu/views/screen/course/module/module_send_task_screen.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';

import '../../../../../utils/animation/slide_animation3.dart';
import '../../../../../utils/color/color.dart';

class ModuleDetailTask extends StatefulWidget {
  static const String routeName = "/moduledetailtask";

  final int? courseId;
  final int? sectionId;
  final String? courseName;
  final String? sectionName;
  final String? linkModule;
  final String? description;

  const ModuleDetailTask({
    super.key,
    this.courseId,
    this.sectionId,
    this.courseName,
    this.sectionName,
    this.linkModule,
    this.description,
  });

  @override
  State<ModuleDetailTask> createState() => _ModuleDetailTaskState();
}

class _ModuleDetailTaskState extends State<ModuleDetailTask> {
  late String fileName;
  late Future<String> fileType;
  late Future<int> fileSize;
  bool isLoading = false;
  // String widget.linkModule.toString() = 'https://web.wpi.edu/Images/CMS/Provost/landscape.pdf';

  @override
  void initState() {
    super.initState();
    fileName = getFileNameFromUrl(widget.linkModule.toString());
    //fileType = getFileType(widget.linkModule.toString());
    //print(fileType);
    fileSize = getFileSize(widget.linkModule.toString());
  }

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
          "Latihan ${widget.sectionId.toString()} - ${widget.sectionName}",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: screenWidth,
              color: whiteColor,
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 18,
                bottom: 28,
              ),
              child: Consumer<ModuleListViewModel>(
                builder: (context, value, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: sectionTask.isEmpty ? 0 : 1,
                      //   itemBuilder: (context, index) {
                      //     return Text(
                      //       widget.description.toString(),
                      //       style: GoogleFonts.poppins(
                      //         fontStyle: FontStyle.normal,
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 11,
                      //       ),
                      //     );
                      //   },
                      // ),
                      Text(
                        "Kerjakan Tugas Matematika Dasar pada dokumen dibawah ini. Jawaban di tulis tangan kemudian diFoto/discan dan kemudian diupload dalam bentuk pdf Nama file (no induk_nama_jenis latihan)",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = !isLoading;
                          });

                          await downloadFile(
                              widget.linkModule.toString(), fileName);

                          if (context.mounted) {
                            setState(() {
                              isLoading = !isLoading;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Berhasil mengunduh tugas !",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                                backgroundColor: successColor,
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 8, top: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: greyColor2,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          width: 200,
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/file_dot.png'),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/file_dot.png'),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/file_dot.png'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              isLoading
                                  ? const LinearProgressIndicator(
                                      minHeight: 3,
                                      color: primaryColor,
                                    )
                                  : const Divider(
                                      color: searchBarTextColor,
                                      height: 3,
                                      thickness: 2,
                                    ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/task_icon.png'),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Text(
                                      fileName,
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: FutureBuilder<int>(
                                    future: fileSize,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
                                          "... kb",
                                          style: GoogleFonts.poppins(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: greyColor2,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        );
                                      } else if (snapshot.hasData) {
                                        return Text(
                                          "${snapshot.data} kb",
                                          style: GoogleFonts.poppins(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: greyColor2,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text(
                                          'Error: ${snapshot.error}',
                                          style: GoogleFonts.poppins(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: greyColor2,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        );
                                      } else {
                                        return Text(
                                          "No Data Available",
                                          style: GoogleFonts.poppins(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: greyColor2,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        );
                                      }
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(SlideAnimation3(
                              page: const ModuleSendTaskScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              'Kumpulkan Tugas',
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
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
        },
      ),
    );
  }
}
