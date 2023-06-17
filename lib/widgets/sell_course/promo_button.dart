import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/views/screen/sell_course/course_voucher_screen.dart';

import '../../utils/animation/slide_animation2.dart';
import '../../utils/color/color.dart';

class PromoButton extends StatelessWidget {
  const PromoButton({
    super.key,
    required this.width,
    required this.text,
    required this.iconImg,
    required this.bgColor,
    required this.borderColor,
    required this.pages,
  });

  final double width;
  final String text;
  final String iconImg;
  final Color bgColor;
  final Color borderColor;
  final Widget pages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: width * 0.42,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(width: 1.5, color: borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, SlideAnimation2(page: const CourseVoucherScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  iconImg,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
