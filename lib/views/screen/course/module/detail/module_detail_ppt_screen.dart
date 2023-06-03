import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/widgets/course/review_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../utils/color/color.dart';

class ModulDetailPPTScreen extends StatefulWidget {
  static const String routeName = "/moduledetailppt";
  const ModulDetailPPTScreen({super.key});

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
        Uri.parse(
            'https://docs.google.com/presentation/d/1Yg81iin3TR0mcEzrTimZyE9E8TrUbCY6ww2bOxh8ETI/edit#slide=id.g118b26f8965_0_195'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
            onPressed: () {
              launchUrl(
                Uri.parse(
                  'https://docs.google.com/presentation/d/1Yg81iin3TR0mcEzrTimZyE9E8TrUbCY6ww2bOxh8ETI/edit#slide=id.g118b26f8965_0_195',
                ),
              );
            },
            icon: const Icon(Icons.launch),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: Container(
        color: whiteColor,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      color: primaryColor,
                      child: WebViewWidget(controller: controller),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Center(
                    //   child: SizedBox(
                    //     height: 44,
                    //     width: MediaQuery.of(context).size.width / 3.8,
                    //     child: OutlinedButton(
                    //       style: OutlinedButton.styleFrom(
                    //         foregroundColor: primaryColor,
                    //         side: const BorderSide(color: primaryColor),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //         ),
                    //       ),
                    //       onPressed: () {},
                    //       child: const Icon(Icons.launch),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          horizontal: 16, vertical: 8),
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
                        showDialog(
                          context: context,
                          builder: (context) => const ReviewDialog(),
                        );
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
        ),
      ),
    );
  }
}
