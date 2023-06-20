import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/animation/fade_animation2.dart';
import 'package:staredu/views/screen/history/history_transaction_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/color/color.dart';

class PaymentWebview extends StatefulWidget {
  final String url;
  const PaymentWebview({super.key, required this.url});

  @override
  State<PaymentWebview> createState() => _PaymentWebviewState();
}

class _PaymentWebviewState extends State<PaymentWebview> {
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: blackColor),
          title: Text(
            "Payment",
            style: GoogleFonts.poppins(
              color: blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  FadeAnimation2(page: const HistoryTransactionScreen()),
                  (route) => false);
            },
          ),
        ),
        body: Container(
          color: primaryColor,
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
