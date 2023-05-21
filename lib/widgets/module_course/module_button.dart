import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color/color.dart';

class ModuleButton extends StatelessWidget {
  const ModuleButton({
    super.key,
    required this.width,
    required this.text,
    required this.borderColor,
  });

  final double width;
  final String text;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
