import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class ButtonFull extends StatelessWidget {
  String title;
  Color color;
  Color textColor;
  Color? borderColor;
  Function()? press;

  ButtonFull(
      {required this.title,
      required this.color,
      required this.textColor,
      this.borderColor,
      this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              this.borderColor != null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: borderColor!),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return lightBlueColor;
              }
              return color;
            },
          ),
        ),
        onPressed: press,
        child: Text(title,
            style: GoogleFonts.poppins(
                fontSize: 14, color: textColor, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
