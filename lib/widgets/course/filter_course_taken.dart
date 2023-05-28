import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color/color.dart';

class FilterCourseTaken extends StatefulWidget {
  const FilterCourseTaken({super.key});

  @override
  State<FilterCourseTaken> createState() => _FilterCourseTakenState();
}

class _FilterCourseTakenState extends State<FilterCourseTaken> {
  bool toggleButton1 = false; //Button Segera Selesai
  bool toggleButton2 = false; //Button Kursus Baru
  bool toggleButton3 = false; //Button Kelas Atas
  bool toggleButton4 = false; //Button Kelas Bawah

  bool toggle1 = false; //Button IPA
  bool toggle2 = false; //Button IPS
  bool toggle3 = false; //Button Mutlimedia
  bool toggle4 = false; //Button TKJ
  bool toggle5 = false; //Button RPL
  bool toggle6 = false; //Button Umum

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "Urutkan",
        style: GoogleFonts.poppins(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Urutkan Berdasarkan',
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.41,
                          decoration: BoxDecoration(
                            color: toggleButton1
                                ? lightBlueColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggleButton1
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggleButton1 = !toggleButton1;
                              });
                            },
                            child: Text(
                              "Segera Selesai",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.41,
                          decoration: BoxDecoration(
                            color: toggleButton2
                                ? lightBlueColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggleButton2
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggleButton2 = !toggleButton2;
                              });
                            },
                            child: Text(
                              "Kursus Baru",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.41,
                          decoration: BoxDecoration(
                            color: toggleButton3
                                ? lightBlueColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggleButton3
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggleButton3 = !toggleButton3;
                              });
                            },
                            child: Text(
                              "Kelas Bawah",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.41,
                          decoration: BoxDecoration(
                            color: toggleButton4
                                ? lightBlueColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggleButton4
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggleButton4 = !toggleButton4;
                              });
                            },
                            child: Text(
                              "Kelas Atas",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            color:
                                toggle1 ? lightBlueColor : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggle1
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggle1 = !toggle1;
                              });
                            },
                            child: Text(
                              "IPA",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            color:
                                toggle2 ? lightBlueColor : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggle2
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggle2 = !toggle2;
                              });
                            },
                            child: Text(
                              "IPS",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            color:
                                toggle3 ? lightBlueColor : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggle3
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {
                              setState(() {
                                toggle3 = !toggle3;
                              });
                            },
                            child: Text(
                              "Multi Media",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                toggle4 ? lightBlueColor : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggle4
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggle4 = !toggle4;
                              });
                            },
                            child: Text(
                              "Teknik Komputer dan Jaringan",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                toggle5 ? lightBlueColor : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggle5
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggle5 = !toggle5;
                              });
                            },
                            child: Text(
                              "Rekayasa Perangkat Lunak",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            color:
                                toggle6 ? lightBlueColor : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: toggle6
                                    ? primaryColor
                                    : searchBarTextColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                toggle6 = !toggle6;
                              });
                            },
                            child: Text(
                              "Umum",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Simpan',
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        )),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
