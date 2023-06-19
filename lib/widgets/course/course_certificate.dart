import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_thumbnail/pdf_thumbnail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/view_model/course/certificate_view_model.dart';

import '../../utils/color/color.dart';

class CourseCertificate extends StatefulWidget {
  final String? pdfLink;

  const CourseCertificate({super.key, this.pdfLink});

  @override
  State<CourseCertificate> createState() => _CourseCertificateState();
}

class _CourseCertificateState extends State<CourseCertificate> {
  late Future<File> pdfFile;

// TODO : Menampilkan File PDF Certificate Sesuai dengan coursenya, menunggu API yang sudah jadi
  @override
  void initState() {
    pdfFile =
        DownloadService.downloadFile(widget.pdfLink.toString(), 'sample.pdf');
    super.initState();
    Provider.of<CertificateViewModel>(context, listen: false).getCertificate();
  }

  @override
  Widget build(BuildContext context) {
    final certificateViewModel =
        Provider.of<CertificateViewModel>(context, listen: false);
    return FutureBuilder<File>(
        future: pdfFile,
        builder: (context, snapshot) {
          return SizedBox(
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
                    child: Consumer<CertificateViewModel>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
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
                                      right: 8,
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
                                                right: 10,
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
                                                              color: blackColor,
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
                                                              color: blackColor,
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
                                                              color: blackColor,
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
                                    onPressed: () async {
                                      certificateViewModel.setLinkPdf =
                                          certificateViewModel
                                              .moduleCertificate[index].link
                                              .toString();
                                      await certificateViewModel.downloadFile();
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Center(
                                              child: Text(
                                                  "Sertifikat Berhasil di Download"),
                                            ),
                                            duration:
                                                const Duration(seconds: 1),
                                            backgroundColor:
                                                blackColor.withOpacity(0.5),
                                          ),
                                        );
                                      }
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
                            );
                          },
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }
}

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
