import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/ppt_model.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/widgets/course/review_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../utils/color/color.dart';

class ModulDetailPPTScreen extends StatefulWidget {
  static const String routeName = "/moduledetailppt";
  final PPTDetailModel pptDetailModel;
  final int? courseId;
  final String? courseName;
  final bool isLastIndex;
  const ModulDetailPPTScreen({
    super.key,
    required this.pptDetailModel,
    this.courseId,
    this.courseName,
    required this.isLastIndex,
  });

  @override
  State<ModulDetailPPTScreen> createState() => _ModulDetailPPTScreenState();
}

class _ModulDetailPPTScreenState extends State<ModulDetailPPTScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..loadRequest(
        Uri.parse(widget.pptDetailModel.url ??
            '${widget.pptDetailModel.url}/embed?frameborder&amp;usp=embed_googleplus'),
      );
  }

  @override
  Widget build(BuildContext context) {
    final screenOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Container(
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: screenOrientation == Orientation.landscape
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          AppBar(
                            backgroundColor: whiteColor,
                            foregroundColor: blackColor,
                            elevation: 0,
                            centerTitle: true,
                            title: Text(
                              "Materi",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              OrientationBuilder(
                builder: (context, orientation) {
                  if (screenOrientation == Orientation.landscape) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          width: MediaQuery.of(context).size.width,
                          color: primaryColor,
                          child: WebViewWidget(controller: controller),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.pptDetailModel.lesson ??
                                "Matematika Dasar - Fungsi Trigonometri",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            widget.pptDetailModel.lessonDescription ??
                                "Mengenal Fungsi Trigonometri",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          color: whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                width: MediaQuery.of(context).size.width / 2.3,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: whiteColor,
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (widget.isLastIndex) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => ReviewDialog(
                                          courseId: widget.courseId!,
                                        ),
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        FadeAnimation(
                                          page: ModuleListScreen(
                                            courseId: widget.courseId,
                                            courseName: widget.courseName,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Selesai",
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                width: MediaQuery.of(context).size.width / 2.3,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: primaryColor,
                                    side: const BorderSide(color: primaryColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Tanya Mentor",
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
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 257,
                        width: MediaQuery.of(context).size.width,
                        color: primaryColor,
                        child: WebViewWidget(controller: controller),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            353 -
                            AppBar().preferredSize.height,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "Matematika Dasar - Fungsi Trigonometri",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "Mengenal Fungsi Trigonometri",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: whiteColor,
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (widget.isLastIndex) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ReviewDialog(
                                        courseId: widget.courseId!,
                                      ),
                                    );
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      FadeAnimation(
                                        page: ModuleListScreen(
                                          courseId: widget.courseId,
                                          courseName: widget.courseName,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Selesai",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: primaryColor,
                                  side: const BorderSide(color: primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Tanya Mentor",
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
                    ],
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
