import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

import '../../utils/animation/slide_animation2.dart';

class RowText extends StatelessWidget {
  final String left;
  final String right;
  final Widget page;
  const RowText(
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
            Navigator.push(context, SlideAnimation2(page: page));
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
