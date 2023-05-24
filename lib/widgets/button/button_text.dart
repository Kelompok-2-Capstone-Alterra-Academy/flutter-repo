import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staredu/utils/color/color.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Function()? press;
  final bool isSelected;
  const ButtonText(
      {super.key, required this.text, this.press, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return lightBlueColor;
                  }
                  return secondaryColor;
                },
              ),
            ),
            onPressed: press,
            child: Text(text,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: whiteColor)))
        : ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  // color
                  side: const BorderSide(color: secondaryColor),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return secondaryColor;
                  }
                  return whiteColor;
                },
              ),
            ),
            onPressed: () {},
            child: Text(text,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor)));
  }
}
