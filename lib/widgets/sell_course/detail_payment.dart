import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/color/color.dart';

class DetailKursus extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;

  const DetailKursus({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: greyColor2,
              size: 18,
            ),
            const SizedBox(width: 11),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 11, fontWeight: FontWeight.w500, color: greyColor2),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
