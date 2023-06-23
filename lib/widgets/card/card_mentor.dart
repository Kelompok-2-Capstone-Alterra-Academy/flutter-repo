import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMentor extends StatelessWidget {
  final String name;
  final String profile;

  CardMentor({Key? key, required this.name, required this.profile})
      : super(key: key);

  List<String> listNameDefault = [
    'Amanda',
    'Budi',
    'Cindy',
    'Diana',
    'Eko',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: profile.isEmpty || profile == 'noimage.png'
                ? const DecorationImage(
                    image: AssetImage('assets/images/default_mentor.jpg'),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage(profile),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Text(name == '' ? listNameDefault[Random().nextInt(4)] : name,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            )),
      ],
    );
  }
}
