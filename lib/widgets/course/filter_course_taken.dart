import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color/color.dart';

class FilterCourseTaken extends StatefulWidget {
  const FilterCourseTaken({super.key});

  @override
  State<FilterCourseTaken> createState() => _FilterCourseTakenState();
}

class _FilterCourseTakenState extends State<FilterCourseTaken> {
  bool selected = false;
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
          builder: (context) => Container(
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
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
                            selected = !selected;
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
                        border: Border.all(width: 1.5, color: primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(lightBlueColor),
                        ),
                        onPressed: () {},
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
                        border: Border.all(width: 1.5, color: primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(lightBlueColor),
                        ),
                        onPressed: () {},
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
                        border:
                            Border.all(width: 1.5, color: searchBarTextColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
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
          ),
        );
      },
    );
  }
}
