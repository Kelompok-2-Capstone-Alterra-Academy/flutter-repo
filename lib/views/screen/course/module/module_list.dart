import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_thumbnail/pdf_thumbnail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/module_section_list.dart';
import 'package:staredu/widgets/course/ongoing_course_taken_list.dart';
import 'package:staredu/widgets/module_course/module_button.dart';
import 'package:staredu/widgets/module_course/module_section_card.dart';

class ModuleListScreen extends StatefulWidget with WidgetsBindingObserver {
  static const String routeName = "/modulelist";

  const ModuleListScreen({super.key});

  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  late Future<File> pdfFile;

  var currentPage = 0;
  @override
  void initState() {
    pdfFile = DownloadService.downloadFile(pdfUrl, 'sample.pdf');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final args = ModalRoute.of(context)!.settings.arguments as ModuleArguments;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: whiteColor,
            foregroundColor: blackColor,
            elevation: 0,
            title: Text(
              args.title,
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  labelColor: primaryColor,
                  unselectedLabelColor: blackColor,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      child: Text(
                        "Modul",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Sertifikat",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  color: whiteColor,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ModuleButton(
                            courseName: args.title,
                            width: screenWidth,
                            text: "Live Session",
                            borderColor: primaryColor,
                          ),
                          ModuleButton(
                            courseName: args.title,
                            width: screenWidth,
                            text: "Quiz",
                            borderColor: primaryColor,
                          ),
                          ModuleButton(
                            courseName: args.title,
                            width: screenWidth,
                            text: "Tanya Mentor",
                            borderColor: primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: moduleSection.length,
                        itemBuilder: (context, index) {
                          return ModuleSectionCard(
                            id: moduleSection[index].id,
                            title: moduleSection[index].title,
                            courseName: args.title,
                            isVideoAvailable: moduleSection[index].video,
                            isMaterialAvailable: moduleSection[index].material,
                            isAssignmentAvailable:
                                moduleSection[index].assignment,
                            isSectionFinished: moduleSection[index].finished,
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
              FutureBuilder<File>(
                  future: pdfFile,
                  builder: (context, snapshot) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: snapshot.hasData
                          ? Container(
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
                                      "Riwayat Belajar Siswa",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Card(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        top: 8,
                                        right: 16,
                                        bottom: 9,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: lightBlueColor,
                                      ),
                                      height: 115,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15,
                                                  top: 10,
                                                  right: 20,
                                                  bottom: 10),
                                              child: Column(
                                                children: [
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .play_circle_outline_sharp,
                                                              size: 18,
                                                              color: Color(
                                                                  0XFF616161),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Video',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: const Color(
                                                                    0XFF616161),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 30,
                                                            ),
                                                            Text(
                                                              "9 Video Pembelajaran",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color:
                                                                    blackColor,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Icon(
                                                              Icons.menu_book,
                                                              size: 18,
                                                              color: Color(
                                                                  0XFF616161),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Materi',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: const Color(
                                                                    0XFF616161),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 25.5,
                                                            ),
                                                            Text(
                                                              "6 Slide Pembelajaran",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color:
                                                                    blackColor,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_circle_outline_rounded,
                                                              size: 18,
                                                              color: Color(
                                                                  0XFF616161),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Tugas',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: const Color(
                                                                    0XFF616161),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 27,
                                                            ),
                                                            Text(
                                                              "5 Tugas Selesai",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color:
                                                                    blackColor,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Nilai :',
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0XFF616161),
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  '90',
                                                  style: GoogleFonts.poppins(
                                                    color: blackColor,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Center(
                                    child: PdfThumbnail.fromFile(
                                      snapshot.data!.path,
                                      currentPage: 1,
                                      height: 320,
                                      scrollToCurrentPage: false,
                                      backgroundColor: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0),
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        downloadFile();
                                      },
                                      child: Center(
                                        child: Text(
                                          'Unduh Sertifikat',
                                          style: GoogleFonts.poppins(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    );
                  }),
            ],
          ),
        ));
  }

  void downloadFile() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    var path = "storage/emulated/0/Download/pdf-certificate3-dummy.pdf";
    var file = File(path);
    var result = await get(
        Uri.parse("https://web.wpi.edu/Images/CMS/Provost/landscape.pdf"));
    file.writeAsBytes(result.bodyBytes);
  }
}

const pdfUrl = 'https://web.wpi.edu/Images/CMS/Provost/landscape.pdf';

class DownloadService {
  static final _httpClient = HttpClient();

  static Future<File> downloadFile(String url, String filename) async {
    var request = await _httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}

class ModuleListQuizArguments {
  final String courseName;

  ModuleListQuizArguments(this.courseName);
}

class ModuleDetailVideoArguments {
  final String courseName;
  final String sectionName;

  ModuleDetailVideoArguments(this.courseName, this.sectionName);
}
