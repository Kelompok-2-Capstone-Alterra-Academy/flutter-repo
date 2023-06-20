import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/color/color.dart';

class ScheduleWebView extends StatefulWidget {
  final String url;
  const ScheduleWebView({super.key, required this.url});

  @override
  State<ScheduleWebView> createState() => _ScheduleWebViewState();
}

class _ScheduleWebViewState extends State<ScheduleWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          "Meeting",
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: Container(
        color: primaryColor,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
