import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowText extends StatelessWidget {
  final String left;
  final String right;
  const RowText({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left,
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
        Text(right,
            style:
                GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
