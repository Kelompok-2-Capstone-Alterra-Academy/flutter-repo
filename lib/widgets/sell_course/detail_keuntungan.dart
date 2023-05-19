import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailKeuntungan extends StatelessWidget {
  final String text;
  final String iconImg;

  const DetailKeuntungan({
    super.key,
    required this.text,
    required this.iconImg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child: Image.asset(iconImg),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
