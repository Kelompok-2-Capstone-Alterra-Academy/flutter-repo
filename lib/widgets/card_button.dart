import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class ScheduleFilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const ScheduleFilterButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateProperty.all<Color>(Colors.white)
              : null,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: isSelected ? primaryColor : null,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
