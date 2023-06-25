import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/animation/fade_animation2.dart';
import 'package:staredu/utils/color/color.dart';

class RowText2 extends StatelessWidget {
  final String left;
  final String right;
  final Widget page;
  const RowText2(
      {Key? key, required this.left, required this.right, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left,
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              FadeAnimation2(page: page),
              (route) => false,
            );
          },
          child: Text(right,
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: blackColor)),
        ),
      ],
    );
  }
}
