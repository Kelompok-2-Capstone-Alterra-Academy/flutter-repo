import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color/color.dart';

//Button for Changing Page
class PrimaryButton extends StatelessWidget {
  final String title;
  final Widget page;

  const PrimaryButton({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.page,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 12),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Button for Open Bottomsheet (Not for Changing Page)
class PrimaryButton2 extends StatelessWidget {
  final String title;
  final Future widgets;

  const PrimaryButton2({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.widgets,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widgets;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 12),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
